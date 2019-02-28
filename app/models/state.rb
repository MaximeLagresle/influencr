class State < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  def algo_check
    self.display_count * 200
  end
end
