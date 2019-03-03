class InfluencersController < ApplicationController

  def show
    @influencer = Influencer.find(params[:id])
  end
end
