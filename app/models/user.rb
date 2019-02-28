class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  after_create :initialize_states

  def initialize_states
    Medium.all.each do |medium|
      State.create!(user: self, medium: medium, display_count: 0)
    end
  end
end
