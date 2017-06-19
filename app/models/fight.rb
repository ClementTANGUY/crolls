class Fight < ApplicationRecord

  has_many :fighters

  def add_combatant(combatant)
    current_fighter = fighters.find_by(combatant_id: combatant.id)
    if current_fighter.nil? && fighters.size < 2
      current_fighter = fighters.build(combatant_id: combatant.id)
    end
  end
end
