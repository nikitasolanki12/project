# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes

  def liked?(user)
    !!user_like(user)
  end

  def user_like(user)
    likes.find { |like| like.user_id == user.id }
  end
  
  scope :comment, -> {joins(:comments).group('posts.id')}

end
