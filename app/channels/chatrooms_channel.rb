class ChatroomsChannel < ApplicationCable::Channel
    def subscribed
        stream_from "api_v1_chatrooms_#{current_user.id}"
    end
end