class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :states
  has_many :preferences, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_create :initialize_states, :initialize_preferences

  def initialize_states
    Medium.all.each do |medium|
      State.create!(user: self, medium: medium, display_count: 0)
    end
  end

  def initialize_preferences
    influencer_one = Influencer.find_by(name: "Marc Andreessen")
    influencer_two = Influencer.find_by(name: "Paul Graham")
    influencer_three = Influencer.find_by(name: "Connie Chan")

    Preference.create!(user: self, influencer: influencer_one)
    Preference.create!(user: self, influencer: influencer_two)
    Preference.create!(user: self, influencer: influencer_three)
  end
end
