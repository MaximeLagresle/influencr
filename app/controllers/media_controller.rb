class MediaController < ApplicationController

  def index
    @media = Medium.all

    @media.each do |medium|
      create_state(medium) if !validate_state?(medium)
    end

    @state = current_user.states.sort_by { |state| state.algo_check }
    @media = @state.first(6).map { |state| state.medium }

    @media.each do |medium|
      increment_state!(medium)
    end
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def find_state(medium)
    State.find_by(medium: medium, user: current_user)
  end

  def validate_state?(medium)
    find_state(medium).present?
  end

  def increment_state!(medium)
    find_state(medium).increment!(:display_count)
  end

  def create_state(medium)
    State.create!(user: current_user, medium: medium, display_count: 1)
  end
end
