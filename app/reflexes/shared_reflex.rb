# frozen_string_literal: true

class SharedReflex < ApplicationReflex
  def close_slide_over_navigation
    morph "#slide-over-navigation", render(SlideOverNavigationComponent.new(active_user: current_user))
  end

  def open_slide_over_navigation
    morph "#slide-over-navigation", render(SlideOverNavigationComponent.new(active: true, active_user: current_user))
  end
end
