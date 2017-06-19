class FightersController < ApplicationController

  before_action :set_fight

  def create
    combatant = Combatant.find(params[:combatant_id])
    @fighter = @fight.add_combatant(combatant)
    respond_to do |format|
      if !@fighter.nil? && @fighter.save
        format.html { redirect_back fallback_location: combatants_url, notice: "Combattant prêt au combat !" }
        format.js { flash.now[:notice] = "Combattant prêt au combat !" }
      else
        format.html { redirect_back fallback_location: combatants_url, alert: "Combattants prêts à s'affronter !" }
        format.js { flash.now[:alert] = "Combattants prêts à s'affronter !" }
      end
    end
    @fight.save
    session[:fight_id] = @fight.id
  end

  def destroy
    @fighter = @fight.fighters.find(params[:id])
    respond_to do |format|
      if @fighter.destroy
        format.html { redirect_back fallback_location: combatants_url, alert: "Combattant sorti de l'arène !" }
        format.js { flash.now[:alert] = "Combattant sorti de l'arène !" }
      end
    end
    @fighters = @fight.fighters
  end

  private

    def set_fight
      @fight = current_fight
    end

end
