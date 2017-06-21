class FightsController < ApplicationController

  def show
    @fight= Fight.find(params[:id])
    fighter1 = @fight.fighters.first
    fighter2 = @fight.fighters.second
    combatant1 = fighter1.combatant
    combatant2 = fighter2.combatant
    if combatant1.life > combatant2.life
      @winner = combatant1
      @looser = combatant2
    elsif combatant1.life < combatant2.life
      @winner = combatant2
      @looser = combatant1
    elsif combatant1.life == combatant2.life
      @winner1 = combatant1
      @winner2 = combatant2
    end
  end

  def create
    @final_fight = Fight.new
    #fighters go from the current_fight to the final fight
    @final_fight.add_fighters(current_fight)
    if @final_fight.save
      #start final fight
      @final_fight.run
      # destroy cart
      Fight.destroy(session[:fight_id])
      session[:fight_id] = nil
      redirect_to fight_url(@final_fight)
    else
      render "combatants/index"
    end
  end

end
