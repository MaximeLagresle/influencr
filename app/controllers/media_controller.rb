class MediaController < ApplicationController

  def index
    @media = Medium.all

    @media.each do |medium|
      validate_state?(medium) ? increment_state!(medium) : create_state(medium)
    end
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def validate_state?(medium)
    State.find_by(medium: medium, user: current_user).present?
  end

  def increment_state!(medium)
    State.find_by(medium: medium, user: current_user).increment!(:display_count)
  end

  def create_state(medium)
    State.create!(user: current_user, medium: medium, display_count: 1)
  end
end
