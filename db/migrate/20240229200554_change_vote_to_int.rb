class ChangeVoteToInt < ActiveRecord::Migration[7.1]
  def up
    change_column :votes, :vote, :integer
  end

  def down
    change_column :votes, :vote, :boolean
  end
end
