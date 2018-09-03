class Monster < ApplicationRecord
  validates :name, presence: true
  validates :armor_class, presence: true
end
