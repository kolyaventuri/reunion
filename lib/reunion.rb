# frozen_string_literal: true

# Defines a reunion, to be filled with activities
class Reunion
  attr_reader :location

  def initialize(location)
    @location = location
  end
end
