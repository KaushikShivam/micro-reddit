# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :link, presence: true, length: { maximum: 140 }
end
