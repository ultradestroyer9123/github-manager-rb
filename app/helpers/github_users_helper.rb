module GithubUsersHelper
    def display_repo(repo)
        "Username: #{repo.github_user.username} | Repo: #{repo.repo} | Description: #{repo.description} | URL: #{repo.url} | Repo Views: #{repo.repo_views} | Language: #{repo.repo_language}"
    end

    def username_options
        GithubUser.select(:username).distinct.map do |github_user|
            [github_user.username, github_user.username]
        end
    end
end
