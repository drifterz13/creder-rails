# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create 3 roles
Role.insert_all!([ "Super Admin", "Admin", "Staff" ].map { |role| { name: role } })

# Create permissions
Permission.insert_all!(
  [
    :view_user, :create_user, :edit_user, :delete_user,
    :view_role, :create_role, :edit_role, :delete_role
  ].map { |permission| { name: permission.to_s.humanize, permit: permission } }
)

# Create role_permissions
super_admin_role = Role.find_by(name: "Super Admin")
admin_role = Role.find_by(name: "Admin")
staff_role = Role.find_by(name: "Staff")

permissions = Permission.all
super_admin_permissions = permissions
admin_permissions = permissions.select { |permission| [:view_user, :create_user, :edit_user, :view_role, :create_role, :edit_role].include?(permission.permit.to_sym) }
staff_permissions = permissions.select { |permission| [:view_role].include?(permission.permit.to_sym) }

RolePermission.create!(super_admin_permissions.map { |permission| { role: super_admin_role, permission: permission } })
RolePermission.create!(admin_permissions.map { |permission| { role: admin_role, permission: permission } })
RolePermission.create!(staff_permissions.map { |permission| { role: staff_role, permission: permission } })

# Create 40 users
users = 40.times.map do
  {
    email: Faker::Internet.email,
    encrypted_password: Devise::Encryptor.digest(User, "password"),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    confirmed_at: Time.now,
    role_id: [ super_admin_role.id, admin_role.id, staff_role.id ].sample
  }
end

User.insert_all!(users)

# Create admin user
User.create!(
  email: "admin@test.com",
  password: "P@ssw0rd",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  confirmed_at: Time.now,
  role: super_admin_role
)

# Create staff user
User.create!(
  email: "staff@test.com",
  password: "P@ssw0rd",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  confirmed_at: Time.now,
  role: staff_role
)
