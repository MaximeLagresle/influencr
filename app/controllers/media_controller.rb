class MediaController < ApplicationController

  def index
    @media = Medium.all

    # checks to see if a state record exists for each medium. creates one if false.

    @media.each do |medium|
      create_state(medium) if !validate_state?(medium)
    end

    # collects all the current user's state records. sorts by the algorithm in the state model.

    @state = current_user.states.sort_by { |state| state.algo_check }

    # stores the ten most relevent medium records in the instance variable @media as an array.

    @media = @state.first(10).map { |state| state.medium }

    # calls the increment method for ONLY the ten associated state records that were displayed.

    @media.each do |medium|
      increment_state!(medium)
    end
  end

  def show
    @medium = Medium.find(params[:id])
  end

  # searches for a state record for each medium associated to the current user

  def find_state(medium)
    State.find_by(medium: medium, user: current_user)
  end

  def validate_state?(medium)
    find_state(medium).present?
  end

  # increases the display count of the state record by 1

  def increment_state!(medium)
    find_state(medium).increment!(:display_count)
  end

  def create_state(medium)
    State.create!(user: current_user, medium: medium, display_count: 1)
  end
end
