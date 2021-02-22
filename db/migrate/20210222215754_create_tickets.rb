class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :class_option
      t.text :review
      t.integer :rating, default: 0, precision: 1, scale: 1
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
