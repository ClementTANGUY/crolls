class FightsController < ApplicationController

  before_action :set_fight

  private

    def set_fight
      @fight = current_fight
    end
end
