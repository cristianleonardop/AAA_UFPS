class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:student, :teacher, :admin]
  has_many :homeworks, class_name: "Homework", foreign_key: 'student_id'
  has_many :knowledges, class_name: "Knowledge", foreign_key: 'teacher_id'
  has_many :tutorings, class_name: "Tutoring", foreign_key: 'teacher_id'
  before_validation :generate_password, on: :admin
  mount_uploader :avatar, AvatarUploader
  
	def generate_password
    self.password = "123456"
  end

  def update_without_password(params, *options)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
