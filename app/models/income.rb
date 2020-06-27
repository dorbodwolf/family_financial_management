class Income < ApplicationRecord
  belongs_to :user
  scope :recent, -> { order("id desc") }
end
