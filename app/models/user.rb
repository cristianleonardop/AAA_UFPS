class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:student, :teacher]
  has_many :homeworks, class_name: "Homework", foreign_key: 'student_id'
  has_many :knowledges, class_name: "Knowledge", foreign_key: 'teacher_id'
  has_many :tutorings, class_name: "Tutoring", foreign_key: 'teacher_id'


end
