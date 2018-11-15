class Api::V1::UsersController < ApplicationController
    before_action :findUser, only: [:update, :destroy, :show, :sent_messages, :received_messages]

    def index
        render json: {errors: "BAD USER! User list is private."}, status: 401
    end

    def show
        render json: @user
    end

    def sent_messages
        render json: @user.sent_messages
    end

    def received_messages
        render json: @user.received_messages
    end

    def update
        @user.update(userParams)
        if @user.save
            render json: {message: "User updated succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again."}, status: :unprocessible_entity
        end
    end

    def create
        user = User.new(usersignkey: userParams["usersignkey"])
        if user.save
            render json: {message: "User created succesfully"}, status: :created
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def destroy
        if @user.destroy
            render json: {message: "User deleted succesfully"}, status: :accepted
        else
            render json: { errors: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    private
    def userParams
        params.permit(:usersignkey)
    end

    def findUser
        @user = User.find(params[:id])
    end
end