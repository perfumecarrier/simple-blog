class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  before_save :clean_up

  def clean_up
    self.email = email.strip.downcase
  end

end
