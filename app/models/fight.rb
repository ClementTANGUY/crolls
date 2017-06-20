class Fight < ApplicationRecord

  has_many :fighters, dependent: :destroy

  def add_combatant(combatant)
    current_fighter = fighters.find_by(combatant_id: combatant.id)
    if current_fighter.nil? && fighters.size < 2
      current_fighter = fighters.build(combatant_id: combatant.id)
    end
  end

  def add_fighters(fight)
    fight.fighters.each do |fighter|
      fighter.fight_id = nil
      fighters << fighter
    end
  end

  def run
    fighter1 = fighters.first
    fighter2 = fighters.second
    combatant1 = fighter1.combatant
    combatant2 = fighter2.combatant
    while (combatant1.life >= combatant2.attack) && (combatant2.life >= combatant1.attack)
      combatant2.life -= combatant1.attack
      combatant1.life -= combatant2.attack
    end
    combatant1.save
    combatant2.save
    if combatant1.life > combatant2.life
      fighter2.destroy
    elsif combatant1.life < combatant2.life
      fighter1.destroy
    else
    end
  end

end
