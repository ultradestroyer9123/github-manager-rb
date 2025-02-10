module GithubUsersHelper
    def display_repo(repo)
        "Username: #{repo.github_user.username} | Repo: #{repo.repo} | Description: #{repo.description} | URL: #{repo.url} | Repo Views: #{repo.repo_views} | Language: #{repo.repo_language}"
    end

    def username_options
        GithubUser.select(:username).distinct.map do |github_user|
            # ask why github_user.avatar_url is not working

            [github_user.username, github_user.username, { "data-icon" => GithubUser.find_by(username: github_user.username).avatar_url }]
        end
    end
end
