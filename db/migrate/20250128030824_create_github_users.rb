class CreateGithubUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :github_users do |t|
      t.string :username
      t.datetime :created_at
    end
  end
end
