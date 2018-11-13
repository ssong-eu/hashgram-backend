class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username
    has_many :chatrooms
    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
end