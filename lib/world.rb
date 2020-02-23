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

  def add_at(location)
    @contents.push(location)
  end

  def alive_at?(_location)
    false
  end

  def tick; end
end
