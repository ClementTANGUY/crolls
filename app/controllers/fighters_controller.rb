class FightersController < ApplicationController

  before_action :set_fight

  before_action :set_fighter, except: [:create]

  def create
    combatant = Combatant.find(params[:combatant_id])
    @fighter = @fight.add_combatant(combatant)
    respond_to do |format|
      if !@fighter.nil? && @fighter.save
        format.html { redirect_back fallback_location: combatants_url, notice: "Combattant envoyé dans l'arène !" }
        format.js { flash.now[:notice] = "Combattant envoyé dans l'arène !" }
      elsif @fight.fighters.size == 2
        format.html { redirect_back fallback_location: combatants_url, alert: "2 Combattants déjà parés au combat !" }
        format.js { flash.now[:alert] = "2 Combattants déjà parés au combat !" }
      else
        format.html { redirect_back fallback_location: combatants_url, alert: "Combattant déjà dans l'arène !" }
        format.js { flash.now[:alert] = "Combattant déjà dans l'arène !" }
      end
    end
    @fight.save
    session[:fight_id] = @fight.id
  end

  def add_weapon
    @combatant = @fighter.combatant
    respond_to do |format|
      if @combatant.attack < 3
        @combatant.update_attribute(:attack, @combatant.attack += 1)
        format.html { redirect_back fallback_location: combatants_url, notice: "Cool, #{@combatant.name} gagne 1 points d'attaque !" }
        format.js { flash.now[:notice] = "Cool, #{@combatant.name} gagne 1 points d'attaque !" }
      end
    end
  end

  def add_shield
    @combatant = @fighter.combatant
    respond_to do |format|
      if @combatant.life >= 5 && @combatant.life < 15
        @combatant.update_attribute(:life, @combatant.life += 5)
        format.html { redirect_back fallback_location: combatants_url, notice: "Cool, #{@combatant.name} gagne 5 points de vie !" }
        format.js { flash.now[:notice] = "Cool, #{@combatant.name} gagne 5 points de vie !" }
      end
    end
  end

  def add_spell
    @combatant = @fighter.combatant
    respond_to do |format|
      if @combatant.life < 5
        @combatant.update_attribute(:life, 18)
        format.html { redirect_back fallback_location: combatants_url, notice: "Cool, #{@combatant.name} se refait une santé !" }
        format.js { flash.now[:notice] = "Cool, #{@combatant.name} se refait une santé !" }
      end
    end
  end

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
