# frozen_string_literal: true

# Defines a reunion, to be filled with activities
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities.push activity
    activity
  end
end
