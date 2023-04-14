class ChangeContentOnMessages < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :content, :string
  end
end
