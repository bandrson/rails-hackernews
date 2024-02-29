class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.text :about, null: false

      t.timestamps
    end
  end
end
