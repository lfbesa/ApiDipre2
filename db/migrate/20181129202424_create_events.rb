class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :epigraph
      t.date :to_date
      t.string :url
      t.string :hour

      t.timestamps
    end
  end
end
