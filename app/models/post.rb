class Post < ApplicationRecord
  belongs_to :user
  validates :comment, presence: true, length: { minimum: 1 }
end
