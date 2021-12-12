class CreateWeathers < ActiveRecord::Migration[6.0]
  def change
    create_table :weathers do |t|
      t.string :name, null: false
      t.string :description
      t.string :icon
      t.string :location, null: false
      t.integer :temp
      t.integer :temp_min
      t.integer :temp_max
      t.integer :pressure
      t.integer :humidity
      t.integer :wind_speed
      t.timestamps
    end
  end
end
