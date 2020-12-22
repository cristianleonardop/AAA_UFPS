class Tutoring < ApplicationRecord
	belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id
	belongs_to :homework
	belongs_to :subject
	enum state: [:in_progress, :complete]
end
