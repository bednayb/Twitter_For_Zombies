class Role < ApplicationRecord
  has_many :assignments
  has_many :zombies, through: :assignments
end
