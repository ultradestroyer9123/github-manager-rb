class GithubUsersAddAvatarUrl < ActiveRecord::Migration[8.0]
  def change
    add_column :github_users, :avatar_url, :string
  end
end
