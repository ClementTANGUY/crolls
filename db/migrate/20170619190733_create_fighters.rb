class CreateFighters < ActiveRecord::Migration[5.0]
  def change
    create_table :fighters do |t|
      t.references :combatant, foreign_key: true
      t.references :fight, foreign_key: true

      t.timestamps
    end
  end
end
