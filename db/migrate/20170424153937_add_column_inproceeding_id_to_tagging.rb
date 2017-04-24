class AddColumnInproceedingIdToTagging < ActiveRecord::Migration[5.0]
  def change
    add_column :taggings, :inproceeding_id, :integer
  end
end
