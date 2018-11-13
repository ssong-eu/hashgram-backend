class Api::V1::ChatroomsController < ApplicationController
    before_action :findChatroom, only: [:show, :update, :destroy]

    def show
        render json: @chatroom
    end

    def update
        @chatroom.update(name: chatroomParams["name"], user_ids: chatroomParams["users"].split(",").map{|n| n.to_i})
        if @chatroom.save
            render json: {message: "Chatroom updated succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def create
        chatroom = Chatroom.new(name: chatroomParams["name"])
        chatroom.user_ids = chatroomParams["users"].split(",").map{|n| n.to_i}
        if chatroom.save
            render json: {message: "Chatroom created succesfully"}, status: :created
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def destroy
        if @chatroom.destroy
            render json: {message: "Chatroom deleted succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end
        
    private
    def chatroomParams
        params.permit(:name, :users)
    end

    def findChatroom
        @chatroom = Chatroom.find(params[:id])
    end
end