class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_many :groups, foreign_key: 'author_id'
  has_many :entities, foreign_key: 'author_id'
end
