class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  belongs_to :role
  validates_presence_of :role

  default_scope { order(first_name: :asc) }
  delegate :name, to: :role, prefix: true

  def permissions
    role.permissions.map { |permission| permission.permit.to_sym }
  end

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
