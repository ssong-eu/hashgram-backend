class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username
    has_many :chatrooms
    class ChatroomSerializer < ActiveModel::Serializer
        attributes :id, :name
    end
end