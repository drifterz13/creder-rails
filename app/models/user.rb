class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  default_scope { order(first_name: :asc) }

  def self.search(val)
    where(
      "first_name LIKE ? OR last_name LIKE ? OR email LIKE ?",
      "%#{val}%", "%#{val}%", "%#{val}%"
    )
  end

  def full_name
    "Anonymous" unless first_name
    "#{first_name} #{last_name}"
  end
end
