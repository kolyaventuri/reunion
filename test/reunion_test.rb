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

  def test_can_calculate_total_cost
    setup_reunion

    assert_equal 14.0, @reunion.total_cost
  end

  def test_can_calculate_split_per_person
    setup_reunion

    expected = [
      { name: 'Sue', amt_owed: -1.0 },
      { name: 'Bob', amt_owed: 2.0 }
    ]

    assert_equal expected, @reunion.split_cost
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
