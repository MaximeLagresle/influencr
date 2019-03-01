class State < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  def algie_check
    # if display_cap is reached, the article is not displayed.

    display_cap = 100

    # gives the lowest display count the highest value

    display_value = display_cap - self.display_count

    # subtracks the the record created_at time from current time

    time_value = Time.now - self.medium.created_at

    # will not display if read/rejected/capped. calculates the overall value.

    if self.read || self.rejected || self.display_count == display_cap
      algie_value = 0
    else
      algie_value = display_value
      # + time_value.to_i
    end

    return algie_value
  end
end
