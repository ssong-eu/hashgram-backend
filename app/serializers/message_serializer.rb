class MessageSerializer < ActiveModel::Serializer
    attributes :sender, :receiver, :message
    belongs_to :sender
    belongs_to :receiver
    class UserSerializer < ActiveModel::Serializer
        attributes :id, :username
    end
end