class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.decimal :longitude, {precision: 10, scale: 6}
      t.decimal :latitude,  {precision: 10, scale: 6}
      t.references :user,   foreign_key: true

      t.timestamps
    end
  end
end
