class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, dependent: :destroy

  delegate :first_name, :last_name, to: :profile, allow_nil: true

  def full_name
    profile ? "#{profile.first_name} #{profile.last_name}" : "Anonymous"
  end
end
