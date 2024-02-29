class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parent_item, foreign_key: {to_table: :items}
      t.string :type, null: false
      t.string :title
      t.text :body
      t.boolean :dead, null: false, default: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
