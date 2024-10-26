class Role < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :role_permissions, dependent: :destroy
  has_many :permissions, through: :role_permissions

  accepts_nested_attributes_for :role_permissions, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true

  def self.search(val)
    where("name LIKE ? OR description LIKE ?", "%#{val}%", "%#{val}%")
  end
end
