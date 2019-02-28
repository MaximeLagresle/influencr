class Medium < ApplicationRecord
  belongs_to :influencer
  belongs_to :format
  belongs_to :platform
  has_many :states, dependent: :destroy
end
