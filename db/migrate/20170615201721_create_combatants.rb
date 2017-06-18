class CreateCombatants < ActiveRecord::Migration[5.0]
  def change
    create_table :combatants do |t|
      t.string :name
      t.integer :life
      t.integer :attack
      t.integer :resistance
      t.integer :experience
      t.string :image_url

      t.timestamps
    end
  end
end
