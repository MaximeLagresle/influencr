class InfluencersController < ApplicationController

  def show
    @influencer = Influencer.find(params[:id])
    @influencers = Influencer.all
    @preferences = Preference.where(user: current_user)
    @media = @influencer.media
    if @influencer.nil?
      @influencer = Influencer.first
      @media = @influencer.media
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def collect_media
    @influencer = Influencer.find(params[:influencer_id])
    @format = Format.find_by(type_of: params[:formata])
    @media = @influencer.media.where(format: @format)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
