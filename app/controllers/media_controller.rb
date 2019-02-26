class MediaController < ApplicationController

  def index
    #@media = Medium.all
  end

  def show
    @medium = Medium.find(params[:id])
  end

end
