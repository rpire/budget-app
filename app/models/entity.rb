class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities
end
