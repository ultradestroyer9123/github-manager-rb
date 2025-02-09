class GithubManager
    def self.process(username)
        obj = new(username)
        obj.run
    end

    def initialize(username)
        @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
        @username = username
        @github_user = nil
        @repos = {}
    end

    def run
        return false if @username.blank?
        
        load_user_repos
        find_or_create_github_user
        store_user_repos
        true
    end

    def load_user_repos
        @repos = @client.repos(@username).map do |repo|
            {
                repo: repo.name,
                description: repo.description || "Not Set",
                url: repo.html_url,
                repo_views: repo.watchers,
                repo_language: repo.language || "Unknown"
            }
        end
    end

    def find_or_create_github_user
        if GithubUser.where(username: @username).exists?
            @github_user = GithubUser.find(username: @username)
        else
            userInfo = @client.user(@username)
            @github_user = GithubUser.create(username: @username, description: userInfo[:bio], location: userInfo[:location] || "Location Not Set")
        end
    end

    def store_user_repos
        @repos.each do |repo|
            GithubRepo.find_or_create_by(
                github_user_id: @github_user.id, 
                repo_views: repo[:repo_views], 
                repo_language: repo[:repo_language], 
                description: repo[:description], 
                url: repo[:url], 
                repo: repo[:repo]
            )
        end
    end
end