# frozen_string_literal: true

require './test/test_helper'

require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new 'Beach'
  end

  def test_can_create_runion
    assert_instance_of Reunion, @reunion
  end

  def test_has_location
    assert_equal 'Beach', @reunion.location
  end

  def test_can_add_activities
    activity = Activity.new 'Frisbee', 5.0
    assert_equal activity, @reunion.add_activity(activity)
    activity2 = Activity.new 'Singalong', 2.0
    assert_equal activity2, @reunion.add_activity(activity2)

    assert_equal [activity, activity2], @reunion.activities
  end
end
