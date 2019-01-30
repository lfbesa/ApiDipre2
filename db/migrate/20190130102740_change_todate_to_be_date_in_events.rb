class ChangeTodateToBeDateInEvents  < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :to_date, :date
  end
end
