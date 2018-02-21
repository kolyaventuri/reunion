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

  def test_can_evaluate_total_cost
    participant = { name: 'Sue', amt_paid: 10.0 }
    @activity.add_participant(participant)

    assert_equal 10.0, @activity.total_cost

    participant2 = { name: 'Bob', amt_paid: 12.5 }
    @activity.add_participant(participant2)

    assert_equal 22.5, @activity.total_cost
  end
end
