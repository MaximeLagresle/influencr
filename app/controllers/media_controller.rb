class MediaController < ApplicationController

  def index
    @media = Medium.all
    user = current_user

    @media.each do |medium|
      State.find(medium.id, user.id).present? ? State.find(one.id, user.id).increment!(:display_count) : StatesController.create(medium)
    end
  end

  def show
    @medium = Medium.find(params[:id])
  end
end
