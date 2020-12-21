# frozen_string_literal: true

class SharedReflex < ApplicationReflex
  def close_slide_over_navigation
    morph "#slide-over-navigation", render(SlideOverNavigationComponent.new)
  end

  def open_slide_over_navigation
    morph "#slide-over-navigation", render(SlideOverNavigationComponent.new(active: true))
  end
end
