class ChatroomSerializer < ActiveModel::Serializer
    attributes :name, :users, :messages
    has_many :messages
    has_many :users
    class MessageSerializer < ActiveModel::Serializer
        attributes :sender_id, :receiver_id, :message
    end
    class UserSerializer < ActiveModel::Serializer
        attributes :id, :name, :username
    end
end