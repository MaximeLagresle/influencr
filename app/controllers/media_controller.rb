class MediaController < ApplicationController
  def index
    @media = Medium.all

    @influencers = Influencer.all

    # checks to see if a state record exists for each medium. creates one if false.

    @media.each do |medium|
      create_state(medium) unless validate_state?(medium)
    end

    # store all the current user's state records. sorts by the algorithm in the state model.

    @state = current_user.states.sort_by(&:algie_check).reverse

    # store the ten most relevent state records. send to the view and increment display_count.
    s_array = []
    tweet_array = []

    @state.each do |s|
      if s.medium.platform.name != "Twitter"
        s_array << s
      else
        tweet_array << s
      end
    end

    insert_tweet = tweet_array.first(3)
    insert_array = s_array.first(9)

    insert_tweet.each do |t|
      insert_array << t
    end

    @state_array = insert_array.map { |state| increment_state!(state.medium) }

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
