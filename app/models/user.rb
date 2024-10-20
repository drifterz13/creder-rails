class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def full_name
    if first_name and last_name
      "#{first_name} #{last_name}"
    else
      "Anonymous"
    end
  end
end
