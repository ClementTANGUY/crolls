class FightersController < ApplicationController

  before_action :set_fight

  before_action :set_fighter, except: [:create]

  def create
    combatant = Combatant.find(params[:combatant_id])
    @fighter = @fight.add_combatant(combatant)
    respond_to do |format|
      if !@fighter.nil? && @fighter.save
        format.html { redirect_back fallback_location: combatants_url, notice: "Combattant prêt au combat !" }
        format.js { flash.now[:notice] = "Combattant prêt au combat !" }
      else
        format.html { redirect_back fallback_location: combatants_url, alert: "Combattant(s) parés au combat !" }
        format.js { flash.now[:alert] = "Combattant(s) parés au combat !" }
      end
    end
    @fight.save
    session[:fight_id] = @fight.id
  end

  def add_weapon
    @combatant = @fighter.combatant
    respond_to do |format|
      if @combatant.attack <= 3
        @combatant.update_attribute(:attack, @combatant.attack += 1)
        format.html { redirect_back fallback_location: combatants_url, notice: "Cool, 1 points d'attaque en plus !" }
        format.js { flash.now[:notice] = "Cool, 1 points d'attaque en plus !" }
      else
        format.html { redirect_back fallback_location: combatants_url, alert: "Au max en attaque !"  }
        format.js { flash.now[:alert] = "Au max en attaque !" }
      end
    end
  end

  def add_shield
    @combatant = @fighter.combatant
    respond_to do |format|
      if @combatant.life <= 15
        @combatant.update_attribute(:life, @combatant.life += 5)
        format.html { redirect_back fallback_location: combatants_url, notice: "Cool, 5 points de vie en plus !" }
        format.js { flash.now[:notice] = "Cool, 5 points de vie en plus !" }
      else
        @combatant.update_attribute(:life, @combatant.life += (20 - @combatant.life))
        format.html { redirect_back fallback_location: combatants_url, alert: "Au max en points de vie !" }
        format.js { flash.now[:alert] = "Au max en points de vie !" }
      end
    end
  end

  # def add_spell
  #   @combatant = @fighter.combatant

  # end

  def destroy
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

    def set_fighter
      @fighter = @fight.fighters.find(params[:id])
    end

end
