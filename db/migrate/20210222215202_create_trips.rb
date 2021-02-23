class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :origin, null: false
      t.string :destination, null: false
      t.date :launch_date, null: false
      t.float :price, null: false
      t.integer :max_tripulation, null: false
      t.string :spaceship_name, null: false
      t.integer :pilot, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
