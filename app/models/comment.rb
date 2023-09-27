# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  # delegate is work for only has_one and belongs_to associations.
  delegate :email, to: :user
end
