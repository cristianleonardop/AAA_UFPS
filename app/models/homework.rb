class Homework < ApplicationRecord
	belongs_to :student, class_name: 'User', foreign_key: :student_id
	has_many :tutorings
	belongs_to :subject

end
