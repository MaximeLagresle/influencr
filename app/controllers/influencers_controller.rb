class InfluencersController < ApplicationController

  def show
    @influencer = Influencer.find(params[:id])

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
