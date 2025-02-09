class CreateGithubRepos < ActiveRecord::Migration[8.0]
  def change
    create_table :github_repos do |t|
      t.references :github_user
      t.integer :repo_views
      t.string :repo_language
      t.text :description
      t.string :url
      t.string :repo
      t.datetime :created_at
    end
  end
end
