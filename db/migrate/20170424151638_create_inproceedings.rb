class CreateInproceedings < ActiveRecord::Migration[5.0]
  def change
    create_table :inproceedings do |t|
      t.string :author
      t.string :title
      t.string :booktitle
      t.integer :year
      t.string :editor
      t.integer :volume
      t.string :series
      t.string :pages
      t.string :address
      t.integer :month
      t.string :organization
      t.string :publisher
      t.string :note
      t.integer :key

      t.timestamps
    end
  end
end
