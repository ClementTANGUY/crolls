class Combatant < ApplicationRecord

  has_many :fighters

  # before_update :reload_life, if: :life_changed?
  # before_update :set_previous_life, if: :life_changed?
  # before_update :set_previous_attack, if: :attack_changed?

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :life, presence: true, numericality: { only_integer: true, greater_or_equal_to: 15 }
  validates :life, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 20 }
  validates :attack, presence: true, numericality: { only_integer: true, greater_or_equal_to: 2 }
  validates :attack, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 4 }
  validates :experience, presence: true, numericality: { only_integer: true, greater_or_equal_to: 25 }
  validates :experience, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 50 }
  validates :image_url, allow_blank: true, format:{
    with:    %r{\.(jpg||png||gif)\Z}i,
    message: 'doit être une url vers une image GIF, JPG ou PNG'
  }

  # def reload_life
  #   write_attribute(:first_life, reload!)
  # end

  # def set_previous_life
  #   write_attribute(:previous_life, life_was)
  # end

  # def set_previous_attack
  #   write_attribute(:previous_attack, attack_was)
  # end

end
