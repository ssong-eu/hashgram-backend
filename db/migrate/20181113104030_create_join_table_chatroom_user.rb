class CreateJoinTableChatroomUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :chatrooms, :users do |t|
      t.index [:chatroom_id, :user_id]
    end
  end
end
