class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  validates :permit, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  enum :permit, [
    :view_user, :create_user, :edit_user, :delete_user,
    :view_role, :create_role, :edit_role, :delete_role
  ]
end
