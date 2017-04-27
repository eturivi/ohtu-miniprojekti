class AddNoteToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :note, :string
  end
end
