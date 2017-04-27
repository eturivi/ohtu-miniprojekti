class AddMonthToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :month, :Integer
  end
end
