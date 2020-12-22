class TutoringPolicy
  attr_reader :user, :resource

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def index?
    is_student_or_teacher
  end

  def create?
    is_student_or_teacher
  end

  def update?
    is_student_or_teacher
  end

  def new?
    is_student_or_teacher
  end

  def edit?
    is_student_or_teacher
  end

  private

  def is_student_or_teacher
    @user.student? || @user.teacher?
  end

end
