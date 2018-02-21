# frozen_string_literal: true

require 'erb'

# Takes ERB templates and renders HTML
class Renderer
  attr_reader :reunion
  TEMPLATE = File.read('./data/template.erb')

  def initialize(reunion)
    @reunion = reunion
  end

  def render
    renderer = ERB.new TEMPLATE
    out = renderer.result binding
    puts out
    out
  end
end
