class ChatroomsChannel < ApplicationCable::Channel
    def subscribed
        @chatroom = Chatroom.find(1)
        stream_from @chatroom
    end

    def received(data)
        ChatroomsChannel.broadcast_to(@chatroom, {chatroom: @chatroom, users:@chatroom.users})
    end
end