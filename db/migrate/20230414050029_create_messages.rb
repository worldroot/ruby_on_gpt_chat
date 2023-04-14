class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :user, null: true, foreign_key: true, type: :uuid
      t.references :replier, null: true, foreign_key: { to_table: :users }, type: :uuid
      t.references :room, null: false, foreign_key: true, type: :uuid
      t.text :content, null: false

      t.timestamps
    end
  end
end
