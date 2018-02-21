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

  def total_cost
    @activities.reduce(0) do |total, activity|
      total + activity.total_cost
    end
  end

  def split_cost
    @activites.map(&:split_cost)
  end
end
