class InfluencersController < ApplicationController

  def show
    @influencer = Medium.find(params[:id])
  end
end
