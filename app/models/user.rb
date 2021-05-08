class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :projects
  has_many :tasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX },
            length: { minimum: 6 }

  validates :password, length: { minimum: 6 }

end
