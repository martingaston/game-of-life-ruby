# frozen_string_literal: true

class World
  def initialize
    @live_cells = []
  end

  def self.empty
    World.new
  end

  def empty?
    @live_cells.empty?
  end

  def add_at(*locations)
    locations.each { |location| @live_cells.push(location) }
  end

  def alive_at?(location)
    @live_cells.include? location
  end

  def tick
    updated_cells = @live_cells.select do |location|
      neighbours = count_neighbours(location)
      neighbours == 2 || neighbours == 3
    end

    dead_cells = []
    @live_cells.each do |location|
      location.neighbours.each do |neighbour|
        dead_cells.push(neighbour) unless dead_cells.include?(neighbour)
      end
    end
    dead_cells = dead_cells.map { |x, y| Location.new(x, y) }

    born_cells = dead_cells.select do |location|
      neighbours = count_neighbours(location)
      neighbours == 3
    end

    @live_cells = updated_cells + born_cells
  end

  private

  def count_neighbours(location)
    @live_cells.count { |neighbour| location.neighbour_of?(neighbour) }
  end
end
