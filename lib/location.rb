# frozen_string_literal: true

class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def neighbours
    remove_negative_neighbours(generate_neighbour_array(@x, @y))
  end

  private

  def generate_neighbour_array(x, y)
    [
      [x - 1, y + 1],
      [x - 1, y],
      [x - 1, y - 1],
      [x, y + 1],
      [x, y - 1],
      [x + 1, y + 1],
      [x + 1, y],
      [x + 1, y - 1]
    ]
  end

  def remove_negative_neighbours(neighbour_array)
    neighbour_array.select { |x, y| x >= 0 && y >= 0 }
  end
end
