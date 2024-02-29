class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :url, null: false

      t.timestamps
    end
    add_index :urls, :url, unique: true
  end
end
