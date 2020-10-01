class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :quick_picks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :username, :email
  validates_uniqueness_of :email
end
