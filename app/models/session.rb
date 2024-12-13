class Session < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :user_id, presence: true

  # callbacks
  before_validation :generate_session_token

  # custom instance method
  private

  def generate_session_token
    self.token = SecureRandom.urlsafe_base64
  end
end
