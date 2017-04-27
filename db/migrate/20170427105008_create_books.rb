class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :publisher
      t.integer :year
      t.integer :volume
      t.string :series
      t.string :address
      t.string :edition
      t.integer :month
      t.string :note
      t.string :key

      t.timestamps
    end
  end
end
