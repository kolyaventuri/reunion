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

  def merge_sum(costs)
    return costs.first if costs.length == 1
    sum = costs[0].merge(costs[1]) do |_key, first, second|
      first + second
    end

    costs[1] = sum
    costs.shift

    merge_sum(costs)
  end

  def split_cost
    merge_sum @activities.map(&:split_cost)
  end

  def cost_string
    split_cost.map do |name, owed|
      price_string = format '%.2f', owed.abs
      "#{name}: #{'-' if owed < 0}$#{price_string}"
    end.join("\n")
  end
end
