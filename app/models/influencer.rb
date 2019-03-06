class Influencer < ApplicationRecord
  has_many :accounts
  has_many :media
  has_many :platforms, through: :accounts
  has_many :preferences, dependent: :destroy
end
