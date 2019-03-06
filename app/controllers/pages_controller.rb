class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @influencer_one = Influencer.find_by(name: "Marc Andreessen")
    @influencer_two = Influencer.find_by(name: "Paul Graham")
    @influencer_three = Influencer.find_by(name: "Sam Altman")
  end
end
