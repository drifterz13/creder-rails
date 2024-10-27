class Course < ApplicationRecord
  validates_presence_of :code, :name
  validates_uniqueness_of :code

  enum :grading_type, [ :letter, :pass_fail ]

  def self.search
    where("name LIKE ? or code LIKE ?", "%#{search}%", "%#{search}%")
  end

  def grading_name
    'letter' if letter?
    'pass/fail' if pass_fail?
  end
end
