class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :author, class_name: "User"
end
