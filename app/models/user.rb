class User < ApplicationRecord
  has_many :location
  has_many :rental
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# I removed :registerable during setup so not anyone can register a user t. Eirik
