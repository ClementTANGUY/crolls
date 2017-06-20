class FightsController < ApplicationController

  def show
    @fight= Fight.find(params[:id])
    @fighters = @fight.fighters
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
