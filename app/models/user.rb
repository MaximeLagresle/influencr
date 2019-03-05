class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :states
  has_many :preferences

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_create :initialize_states, :initialize_preferences

  def initialize_states
    Medium.all.each do |medium|
      State.create!(user: self, medium: medium, display_count: 0)
    end
  end

  def initialize_preferences
    Influencer.first(3).each do |influencer|
      Preference.create!(user: self, influencer: influencer)
    end
  end
end
