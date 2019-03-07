class MediaController < ApplicationController
  def index

    # Initialize instance variables
    @all_media = Medium.all
    @all_influencers = Influencer.all

    # Initialize Influencer list for user
    @my_preference = Preference.where(user: current_user)
    @my_influencers = @my_preference.map { |p| p.influencer }
    @not_my_influencers = @all_influencers.reject { |i| @my_influencers.include?(i) }

    # Initialize Media list from user's influencer list
    @my_media = @all_media.select { |m| @my_influencers.include?(m.influencer) }
    @my_media.each do |medium|
      # Create a state unless it already exists
      create_state(medium) unless validate_state?(medium)
    end

    # Initialize my State list
    @all_my_states = State.where(user: current_user)
    @my_states = @all_my_states.select { |s| @my_influencers.include?(s.medium.influencer) }

    # !!! REMOVE TWEET FROM ALL MEDIA LIST !!! <---------------------------------------- ! WARNING
    # @media.take_while { |medium| medium.platform.name != "Twitter" }

    # sorts the state with the "SUPER" algorithm  ---> in the State model
    # sort_by_algo(@my_states)





    # ---------- BEFORE


    # store all the current user's state records. sorts by the algorithm in the state model.
    # @state = current_user.states.sort_by(&:algie_check).reverse

    # store the ten most relevent state records. send to the view and increment display_count.
    # state_array = []
    # tweet_array = []

    # @state.each do |state|
    #   if s.medium.platform.name != "Twitter"
    #     s_array << s
    #   else
    #     tweet_array << s
    #   end
    # end

    # insert_tweet = tweet_array.first(3)
    # insert_array = s_array.first(9)

    # insert_tweet.each do |t|
    #   insert_array << t
    # end

    # @state_array = insert_array.map { |state| increment_state!(state.medium) }

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

  def show
    @medium = Medium.find(params[:id])
    @state = find_state(@medium)
  end



  # INSTANCE METHODS

  # Create a state for medium
  def create_state(medium)
    State.create!(user: current_user, medium: medium)
  end

  # validate if a state exist for that medium and current_user
  def validate_state?(medium)
    find_state(medium).present?
  end





  # searches for a state record for each medium associated to the current user
  def find_state(medium)
    State.find_by(medium: medium, user: current_user)
  end

  # sorts the list with algorithm - in state model
  def sort_by_algo(state_list)
    state_list.sort_by(&:algie_check)
  end

  # increases the display count of the state record by 1
  def increment_state!(medium)
    find_state(medium).increment!(:display_count)
  end
end
