class InfluencersController < ApplicationController

  def show

    # Initialize instance variables
    @influencer = Influencer.find(params[:id])
    @all_influencers = Influencer.all

    # Initialize Influencer list for user
    @my_preference = Preference.where(user: current_user)
    @my_influencers = @my_preference.map { |p| p.influencer }
    @not_my_influencers = @all_influencers.reject { |i| @my_influencers.include?(i) }







    @preference = Preference.find_by(user: current_user, influencer: @influencer)

    form = Format.find_by(type_of: "article")
    @media = @influencer.media.where(format: form)

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
