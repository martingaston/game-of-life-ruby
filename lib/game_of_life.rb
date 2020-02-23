require 'gosu'

class GameOfLife < Gosu::Window
  def initialize
    super 1024, 768
    self.caption = "Game Of Life"
  end

  def needs_cursor?
    true
  end

  def update
  end

  def draw
  end
end

GameOfLife.new.show
