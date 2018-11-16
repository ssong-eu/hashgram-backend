module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      # @jwt_token = request.params[:token]
      self.current_user = get_current_user
    end
 
    # private
    #   attr_reader :jwt_token


  end
end
