class AddUrlToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :url, foreign_key: true
  end
end
