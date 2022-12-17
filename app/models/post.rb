class Post < ApplicationRecord
  
  belongs_to :user, optional: true
  has_one_attached :image  
  has_many :comments, dependent: :destroy
end
