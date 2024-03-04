class RenameItemParentKey < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :parent_item_id, :parent_id
  end
end
