class User < ApplicationRecord
    has_and_belongs_to_many :chatrooms
    has_secure_password
    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id', dependent: :destroy
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
    validates :username, uniqueness: true, presence: true, case_sensitive: false
end
