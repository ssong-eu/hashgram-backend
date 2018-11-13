class ChatroomSerializer < ActiveModel::Serializer
    attributes :name, :users, :messages
end