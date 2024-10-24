class Role < ApplicationRecord
  has_many :users
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  accepts_nested_attributes_for :role_permissions, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, uniqueness: true
end
