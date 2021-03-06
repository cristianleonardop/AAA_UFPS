# frozen_string_literal: true

class Components::SlideOverReflex < ApplicationReflex
  def close_slide_over
    morph "#slide-over-component", render(SlideOverComponent.new(active_user: current_user))
  end

  def open_slide_over
    morph "#slide-over-component", render(SlideOverComponent.new(active: true, homework: homework, active_user: current_user))
  end

  private

  def homework
    homework_id = element.dataset.homework_id

    Homework.find_by(id: homework_id)
  end
end
