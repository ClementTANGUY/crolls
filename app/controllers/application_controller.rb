class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_fight

  private

    def current_fight
      if !session[:fight_id].nil?
        Fight.find(session[:fight_id])
      else
        Fight.new
      end
      rescue ActiveRecord::RecordNotFound
        Fight.new
    end
end
