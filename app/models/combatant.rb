class Combatant < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :life, presence: true, numericality: { only_integer: true, greater_or_equal_to: 15, less_than_or_equal_to: 20 }
  validates :attack, presence: true, numericality: { only_integer: true, greater_or_equal_to: 2, less_than_or_equal_to: 4 }
  validates :experience, presence: true, numericality: { only_integer: true, greater_or_equal_to: 25, less_than_or_equal_to: 50 }
  validates :image_url, allow_blank: true, format:{
    with:    %r{\.(jpg||png||gif)\Z}i,
    message: 'doit être une url vers une image GIF, JPG ou PNG'
  }

end
