require './test/test_helper'

require './lib/activity'

class ActivityTest < Minitest::Test
  def test_can_create_activity
    activity = Activity.new 'Foo'
    assert_instance_of Activity, activity
  end

  def test_activity_can_have_name
    activity = Activity.new 'Hiking'
    assert_equal 'Hiking', activity.name
  end
end
