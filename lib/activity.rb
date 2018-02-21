# frozen_string_literal: true

# Defines an activity for the reunion
class Activity
  attr_reader :name,
              :participants,
              :price_per_participant

  def initialize(name, price)
    @name = name
    @price_per_participant = price
    @participants = []
  end

  def add_participant(participant)
    @participants.push participant
    participant
  end

  def total_cost
    @price_per_participant * @participants.length
  end
end
