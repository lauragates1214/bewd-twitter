class Session < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :user_id, presence: true
end
