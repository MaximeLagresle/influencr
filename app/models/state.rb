class State < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  def algie_check
    self.display_count * 200
  end
end

# a medium has a display_count state
# a medium has a read state
# a medium has a rejected state
# a medium has created_at (date object)
# current_user has last_sign_in_at (date object)
