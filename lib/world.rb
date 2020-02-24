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
    @live_cells = check_for_survivors + check_for_births
  end

  private

  def count_neighbours(location)
    @live_cells.count { |neighbour| location.neighbour_of?(neighbour) }
  end

  def check_for_survivors
    @live_cells.select do |location|
      [2, 3].include?(count_neighbours(location))
    end
  end

  def check_for_births
    dead_cells = []
    @live_cells.each do |location|
      location.neighbours.each do |x, y|
        neighbour = Location.new(x, y)
        dead_cells.push(neighbour) unless dead_cells.include?(neighbour)
      end
    end

    dead_cells.select do |location|
      count_neighbours(location) == 3
    end
  end
end
