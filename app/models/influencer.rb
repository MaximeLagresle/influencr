class Influencer < ApplicationRecord
  has_many :accounts
  has_many :media
  has_many :platforms, through: :accounts
end
