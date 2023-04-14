class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :rooms, :title, unique: true
  end
end
