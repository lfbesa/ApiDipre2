class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :epigraph
      t.string :to_date
      t.string :url
      t.string :hour

      t.timestamps
    end
  end
end
