# frozen_string_literal: true

class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @neighbours = neighbours(x, y)
  end

  def neighbour_of?(location)
    @neighbours.include? [location.x, location.y]
  end

  private

  def neighbours(x, y)
    [
      [x - 1, y + 1],
      [x - 1, y],
      [x - 1, y - 1],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y + 1],
      [x + 1, y],
      [x + 1, y - 1]
    ].select { |x, y| x >= 0 && y >= 0 }
  end
end
