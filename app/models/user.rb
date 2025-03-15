class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id"
  has_many :photos, foreign_key: "owner_id"
end
