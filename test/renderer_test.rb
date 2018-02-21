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

  def setup_reunion
    activity = Activity.new 'Frisbee', 5.0
    activity2 = Activity.new 'Singalong', 2.0

    activity.add_participant(name: 'Sue', amt_paid: 5.0)
    activity.add_participant(name: 'Bob', amt_paid: 3.0)

    activity2.add_participant(name: 'Sue', amt_paid: 3.0)
    activity2.add_participant(name: 'Bob', amt_paid: 2.0)

    @reunion.add_activity activity2
    @reunion.add_activity activity
  end
end
