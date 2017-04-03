class AddJournalToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :journal, :text
  end
end
