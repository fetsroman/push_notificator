class User < ApplicationRecord
  has_secure_password

  has_many :devices, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
