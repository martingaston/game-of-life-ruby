# frozen_string_literal: true

class World
  def initialize
    @cells = Hash.new(:dead)
  end

  def self.empty
    World.new
  end

  def empty?
    @cells.empty?
  end

  def add_at(*locations)
    locations.each do |location|
      @cells[location] = :alive
      location.neighbours.each { |x, y| @cells[Location.new(x, y)] = :dead unless @cells.has_key?(Location.new(x, y)) }
    end
  end

  def alive_at?(location)
    @cells[location] == :alive
  end

  def tick
    check_for_survivors
  end

  private

  def count_neighbours(location)
    location.neighbours.count { |x, y| @cells[Location.new(x, y)] == :alive }
  end

  def check_for_survivors
    @new_cells = {}

    @cells.each do |location, status|
      if @cells[location] == :alive
        if [2, 3].include?(count_neighbours(location))
          @new_cells[location] = :alive
          location.neighbours.each { |x, y| @new_cells[Location.new(x, y)] = :dead unless @new_cells.has_key?(Location.new(x, y)) }
        end
      elsif @cells[location] == :dead
        if count_neighbours(location) == 3
          @new_cells[location] = :alive
          location.neighbours.each { |x, y| @new_cells[Location.new(x, y)] = :dead unless @new_cells.has_key?(Location.new(x, y)) }
        end
      end
    end

    @cells = @new_cells
  end
end
