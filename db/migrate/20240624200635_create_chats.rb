class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :title
      t.string :messages
      t.string :dateUpdate
      t.string :current_model

      t.timestamps
    end
  end
end
