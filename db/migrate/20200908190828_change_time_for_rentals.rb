class ChangeTimeForRentals < ActiveRecord::Migration[6.0]
  def change
    change_table :rentals do |t|
      t.remove :start_date, :end_date
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
