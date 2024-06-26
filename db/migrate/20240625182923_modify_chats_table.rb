class ModifyChatsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :chats, :title, :id_user
    rename_column :chats, :dateUpdate, :username
    remove_column :chats, :current_model, :string
  end
end
