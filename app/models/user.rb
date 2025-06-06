class User < ApplicationRecord
  # associations
  has_many :sessions
  has_many :tweets

  # validations
  validates :username,
    presence: true,
    uniqueness: true,
    :length => { minimum: 3, maximum: 64 }
  validates :password, 
    presence: true, 
    uniqueness: true,
    :length => { minimum: 8, maximum: 64 }
  validates :email, 
    presence: true, 
    uniqueness: true,
    :length => { minimum: 5, maximum: 500 }

  after_validation :hash_password

  private

  def hash_password
    self.password = BCrypt::Password.create(password)
  end
end
