class AddColumnBookIdToTaggingss < ActiveRecord::Migration[5.0]
  def change
    add_column :taggings, :book_id, :integer
  end
end
