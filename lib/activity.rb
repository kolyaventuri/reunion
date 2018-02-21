# Defines an activity for the reunion
class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participant(participant)
    @participants.push participant
    participant
  end

  def total_cost
    @participants.reduce(0) do |total, participant|
      total + participant[:amt_paid]
    end
  end
end
