class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
