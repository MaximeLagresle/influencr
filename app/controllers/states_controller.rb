class StatesController < ApplicationController

# This creates a new state record on first display

  def create(medium)
    user = current_user
    States.create!(user: user, medium: medium, display_count: 1)
  end
end
