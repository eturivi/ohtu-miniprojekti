class AddPagesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :pages, :Integer
  end
end
