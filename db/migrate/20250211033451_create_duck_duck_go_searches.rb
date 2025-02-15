class CreateDuckDuckGoSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :duck_duck_go_searches do |t|
      t.string :query
      t.timestamps
    end
  end
end
