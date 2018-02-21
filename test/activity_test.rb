# frozen_string_literal: true

require './test/test_helper'

require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new 'Hiking', 11.0
  end

  def test_can_create_activity
    assert_instance_of Activity, @activity
  end

  def test_can_have_name_and_price
    assert_equal 'Hiking', @activity.name
    assert_equal 11.0, @activity.price_per_participant
  end

  def test_activity_starts_empty
    expected = {}
    assert_equal expected, @activity.participants
  end

  def test_can_add_participants
    participant = { name: 'Sue', amt_paid: 10.0 }
    assert_equal participant, @activity.add_participant(participant)

    expected = { 'Sue' => 10.0 }
    assert_equal expected, @activity.participants

    participant2 = { name: 'Bob', amt_paid: 12.0 }
    assert_equal participant2, @activity.add_participant(participant2)

    expected = { 'Sue' => 10.0, 'Bob' => 12.0 }

    assert_equal expected, @activity.participants
  end

  def test_can_evaluate_total_cost
    participant = { name: 'Sue', amt_paid: 10.0 }
    @activity.add_participant(participant)

    participant2 = { name: 'Bob', amt_paid: 12.5 }
    @activity.add_participant(participant2)

    assert_equal 22.0, @activity.total_cost
  end

  def test_can_calculate_split
    participant = { name: 'Sue', amt_paid: 10.0 }
    participant2 = { name: 'Bob', amt_paid: 12.5 }
    @activity.add_participant(participant)
    @activity.add_participant(participant2)

    expected = {
      'Sue' => 1.0,
      'Bob' => -1.5
    }

    assert_equal expected, @activity.split_cost
  end
end
