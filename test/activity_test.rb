require './test/test_helper'

require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new 'Hiking'
  end

  def test_can_create_activity
    assert_instance_of Activity, @activity
  end

  def test_can_have_name
    assert_equal 'Hiking', @activity.name
  end

  def test_can_add_participants
    assert_equal [], @activity.participants

    participant = { name: 'Sue', amt_paid: 10.0 }
    assert_equal participant, @activity.add_participant(participant)

    assert_equal [participant], @activity.participants

    participant2 = { name: 'Bob', amt_paid: 12.0 }
    assert_equal participant2, @activity.add_participant(participant2)

    assert_equal [participant, participant2], @activity.participants
  end
end
