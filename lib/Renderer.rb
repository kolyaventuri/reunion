# frozen_string_literal: true

# Takes ERB templates and renders HTML
class Renderer
  attr_reader :reunion

  def initialize(reunion)
    @reunion = reunion
  end
end
