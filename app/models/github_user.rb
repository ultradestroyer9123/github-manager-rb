class GithubUser < ApplicationRecord
    has_many :github_repos
end
