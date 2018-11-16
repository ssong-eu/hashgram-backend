class Chatroom < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :messages
    has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
    has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
    has_many :messages, dependent: :destroy
    # validates :users, uniqueness: true
    validates :name, case_sensitive: false
end
