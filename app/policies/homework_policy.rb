class HomeworkPolicy
  attr_reader :user, :resource

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def index?
    is_student
  end

  def create?
    is_student
  end

  def update?
    is_student
  end

  def new?
    is_student
  end

  def edit?
    is_student
  end

  private

  def is_student
    @user.student?
  end

end
