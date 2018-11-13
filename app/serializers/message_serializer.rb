class MessageSerializer < ActiveModel::Serializer
    attributes :sender, :receiver, :message
end