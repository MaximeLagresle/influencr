class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @influencers_growth_strategy = []
    influencer_one = Influencer.find_by(name: "Marc Andreessen")
    influencer_two = Influencer.find_by(name: "Paul Graham")
    influencer_three = Influencer.find_by(name: "Sam Altman")
    @influencers_growth_strategy << influencer_one
    @influencers_growth_strategy << influencer_two
    @influencers_growth_strategy << influencer_three
  end
end
