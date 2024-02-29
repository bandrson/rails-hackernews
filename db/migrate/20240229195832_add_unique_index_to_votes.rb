class AddUniqueIndexToVotes < ActiveRecord::Migration[7.1]
  def change
    add_index :votes, [:user_id, :item_id], unique: true
  end
end
