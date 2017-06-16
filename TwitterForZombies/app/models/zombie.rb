class Zombie < ApplicationRecord

  before_save :make_rotting



  has_many :tweets, dependent: :destroy
  has_one :brain, dependent: :destroy
  has_many :assignments
  has_many :roles, through: :assignments

  scope :rotting, -> {where(rotting: true)}
  scope :fresh, -> {where("age < 20")}
  scope :recent,-> { order("created_at desc").limit(3)}

  def make_rotting
    if age > 20
      self.rotting = true
    else
      self.rotting = false
    end
  end

  private

  def decomp_change_notification
    ZombieMailer.decomp_change(self).deliver
  end

end
