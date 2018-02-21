# frozen_string_literal: true

require './test/test_helper'

require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new 'Beach'
  end

  def test_can_create_runion
    assert_instance_of Runion, reunion
  end
end
