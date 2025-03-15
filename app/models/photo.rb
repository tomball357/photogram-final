class Photo < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
