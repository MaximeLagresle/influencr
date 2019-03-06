class PreferencesController < ApplicationController

  def create
    influencer = Influencer.find(params[:influencer_id])
    preference = Preference.new(user: current_user, influencer: influencer)
    preference.save

    redirect_to influencer_path(influencer.id)
  end

  def destroy
    influencer = Influencer.find(params[:influencer_id])
    preference = Preference.find(params[:id])
    preference.destroy

    redirect_to influencer_path(influencer.id)
  end
end
