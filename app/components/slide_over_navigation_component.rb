# frozen_string_literal: true

class SlideOverNavigationComponent < ViewComponent::Base
  def initialize(active: false, active_user: nil)
    @active = active
    @active_user = active_user
    @state = @active ? :open : :close
  end

  def set_transition_opacity_class
    opacity_classes = { open: "opacity-100", close: "opacity-0 hidden" }
    opacity_classes[@state]
  end

  def set_transition_translate_class
    translate_classes = { open: "translate-x-0", close: "-translate-x-full" }
    translate_classes[@state]
  end
end
