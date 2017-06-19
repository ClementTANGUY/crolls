class Fighter < ApplicationRecord

  belongs_to :combatant
  belongs_to :fight

end
