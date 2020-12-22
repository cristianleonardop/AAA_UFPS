# frozen_string_literal: true

class SlideOverComponent < ViewComponent::Base
  def initialize(active: false, homework: nil, active_user: nil)
    @active = active
    @homework = homework
    @state = @active ? :open : :close
    @active_user = active_user
  end

  def set_transition_translate_class
    translate_classes = { open: "translate-x-0", close: "translate-x-full" }
    translate_classes[@state]
  end
end
