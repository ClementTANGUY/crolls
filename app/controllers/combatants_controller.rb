class CombatantsController < ApplicationController

  before_action :set_combatant, only: [:show, :edit, :update, :destroy]

  def index
    @combatants = Combatant.order(id: :asc)
  end

  def show
  end

  def new
    @combatant = Combatant.new
  end

  def create
    @combatant = Combatant.new(combatant_params)
    if @combatant.save
      redirect_to combatants_url, notice: "Nouveau combattant créé"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @combatant.update(combatant_params)
      redirect_to combatant_url(@combatant), notice: "Combattant modifié"
    else
      render :edit
    end
  end

  def destroy
    @combatant.destroy
    redirect_to combatants_url, alert: "Combattant supprimé"
  end

  private

  def set_combatant
    @combatant = Combatant.find(params[:id])
  end

  def combatant_params
    params.require(:combatant).permit(:name, :life, :attack, :resistance, :experience, :image_url)
  end

end
