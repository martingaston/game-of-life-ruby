# frozen_string_literal: true

class World
  def initialize
    @contents = []
  end

  def self.empty
    World.new
  end

  def empty?
    @contents.empty?
  end

  def add_at(*locations)
    locations.each { |location| @contents.push(location) }
  end

  def alive_at?(location)
    @contents.include? location
  end

  def tick
    @contents.each do |location|
      neighbours = count_neighbours(location)
      @contents.delete(location) unless neighbours == 2 || neighbours == 3
    end
  end

  private

  def count_neighbours(location)
    @contents.count { |neighbour| location.neighbour_of?(neighbour) }
  end
end
