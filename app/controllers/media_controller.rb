class MediaController < ApplicationController
  def index
    if current_user.first_onboarding
      p "-------------------- DEBUG TRACE 001"
      current_user.first_onboarding = false
      if current_user.save!
        redirect_to tutorial_path
      else
        raise "failed to update user"
      end
    else
      p "-------------------- DEBUG TRACE 002"
      @media = Medium.all
      @influencers = Influencer.all

      @preferences = Preference.where(user: current_user)

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

      # defaults to the first influencer's media for filter window

      @influencer = Influencer.first if @influencer.nil?

      # define first preference to show add or delete option

      @preference = Preference.find_by(user: current_user, influencer: @influencer)

      # set default format to article, display the influencer's articles only

      form = Format.find_by(type_of: "article")
      @media = @influencer.media.where(format: form)

      #Active Record alternative for faster processing.
      # @influencer.media.joins(:format).where(formats: { type_of: "article" } ).count
    end
  end

  def show
    @medium = Medium.find(params[:id])
    @state = find_state(@medium)
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
