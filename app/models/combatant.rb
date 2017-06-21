class Combatant < ApplicationRecord

  include ActiveModel::Dirty

  # define_attribute_methods :life


  has_many :fighters

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

  # def initialize
  #   @life = life
  # end

  # def life=(val)
  #   life_will_change! unless val == @life
  #   @life = val
  # end

  # def save
  #   # do persistence work

  #   changes_applied
  # end

  # def reload!
  #   # get the values from the persistence layer

  #   clear_changes_information
  # end

  # def rollback!
  #   restore_attributes
  # end

end
