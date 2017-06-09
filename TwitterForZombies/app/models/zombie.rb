class Zombie < ApplicationRecord

  # before_save :make_rotting

  scope :rotting, -> {where(rotting: true)}
  scope :fresh, -> {where("age < 20")}
  scope :recent,-> { order("created_at desc").limit(3)}

  def make_rotting
    if age > 20
      self.rotting = true
    end
  end
end
