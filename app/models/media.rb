class Media < ApplicationRecord
  belongs_to :influencer
  belongs_to :format
  belongs_to :platform
end
