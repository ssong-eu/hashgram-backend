class User < ApplicationRecord
    has_and_belongs_to_many :chatrooms
    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
end
