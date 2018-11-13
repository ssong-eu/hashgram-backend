class Api::V1::MessagesController < ApplicationController
    before_action :findMessage, only: [:update, :destroy]

    def update
        @message.update(sender_id: messageParams["sender"].to_i, receiver_id: messageParams["receiver"].to_i, chatroom_id: messageParams["chatroom"].to_i, message: messageParams["message"])
        if @message.save
            render json: {message: "Message updated succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def create
        message = Message.new(sender_id: messageParams["sender"].to_i, receiver_id: messageParams["receiver"].to_i, chatroom_id: messageParams["chatroom"].to_i, message: messageParams["message"])
        if message.save
            render json: {message: "Message created succesfully"}, status: :created
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def destroy
        if @message.destroy
            render json: {message: "Message deleted succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end
        
    private
    def messageParams
        params.permit(:sender, :receiver, :chatroom, :message)
    end

    def findMessage
        @message = Message.find(params[:id])
    end
end