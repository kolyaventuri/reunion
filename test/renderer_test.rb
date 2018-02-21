# frozen_string_literal: true

require_relative 'test_helper.rb'

require './lib/Renderer.rb'

class RendererTest < Minitest::Test
  def setup
    @renderer = Renderer.new
  end

  def test_does_create_renderer
    assert_instance_of Renderer, @renderer
  end
end
