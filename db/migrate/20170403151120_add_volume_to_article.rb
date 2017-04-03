class AddVolumeToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :volume, :integer
  end
end
