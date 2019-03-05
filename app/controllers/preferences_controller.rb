class PreferencesController < ApplicationController

  def index
    @preferences = Preference.where(user: current_user)
  end
end
