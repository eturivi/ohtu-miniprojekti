class ChangeColumnInproceedingKey < ActiveRecord::Migration[5.0]
  def change
    change_column :inproceedings, :key, :string
  end
end
