class AddKarmaToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :karma, :integer, default: 0, null: false
  end
end
