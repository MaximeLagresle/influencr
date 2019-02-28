class Platform < ApplicationRecord
  has_many :media, dependent: :destroy
  has_many :accounts, dependent: :destroy
end
