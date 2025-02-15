class CreateDuckDuckGoResults < ActiveRecord::Migration[8.0]
  def change
    create_table :duck_duck_go_results do |t|
      t.references :duck_duck_go_search
      t.string :title
      t.string :link
      t.text :description

      t.timestamps
    end
  end
end
