class Api::V1::UsersController < ApplicationController
    before_action :findUser, only: [:update, :destroy, :show, :sent_messages, :received_messages]

    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {id: user.id, token: issue_token({id: user.id})}
        else
            render json: {error: 'Invalid username/password combination.'}, status: 400
        end
    end

    def validate
    user = get_current_user
        if user
            render json: {id: user.id, token: issue_token({id: user.id})}
        else
            render json: {error: 'User not found.'}, status: 400
        end
    end
    

    def index
        render json: User.all
    end

    def show
        if @user
            render json: @user
        else
            render json: {error: 'You are not signed in.'} 
        end
    end

    def sent_messages
        if user
            render json: user.sent_messages
        else
            render json: {error: 'You are not signed in.'} 
        end
    end

    def received_messages
        if user
            render json: user.received_messages
        else
            render json: {error: 'You are not signed in.'} 
        end
    end

    def update
        if user
            user.update(userParams)
            if user.save
                render json: {message: "User updated succesfully"}, status: :accepted
            else
                render json: { error: "There was an error, please try again."}, status: :unprocessible_entity
            end
        else
            render json: {error: 'You are not signed in.'} 
        end
    end

    def create
        user = User.new(userParams)
        if user.save
            # byebug
            render json: {id: user.id, token: issue_token({id: user.id})}
            # render json: {message: "User created succesfully"}, status: :created
        else
            render json: { error: "There was an error, please try again." }, status: :unprocessible_entity
        end
    end

    def destroy
        if user
            if user.destroy
                render json: {message: "User deleted succesfully"}, status: :accepted
            else
                render json: { error: "There was an error, please try again." }, status: :unprocessible_entity
            end
        else
            render json: {error: 'You are not signed in.'} 
        end
    end

    private
    def userParams
        params.permit(:username, :password)
    end

    def findUser
        @user = User.find(params[:id])
        # user = get_current_user
    end
end
