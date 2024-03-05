class AddScoreToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :score, :integer, default: 0, null: false
  end
end
