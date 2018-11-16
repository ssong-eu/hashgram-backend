class ChatroomsChannel < ApplicationCable::Channel
    def subscribed
        @chatroom = Chatroom.find_by(id: params[:chatroom])
        stream_from @chatroom
    end

    def received(data)
        ChatroomsChannel.broadcast_to(@chatroom, {chatroom: @chatroom, users:@chatroom.users})
    end
end