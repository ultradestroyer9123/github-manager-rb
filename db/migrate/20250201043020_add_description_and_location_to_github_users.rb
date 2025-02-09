class AddDescriptionAndLocationToGithubUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :github_users, :description, :text
    add_column :github_users, :location, :string
  end
end
