# frozen_string_literal: true

require 'gosu'
require_relative 'colours'

class GameOfLife < Gosu::Window
  WIDTH = 1024
  HEIGHT = 768
  CELL_SIZE = 8

  def initialize
    super WIDTH, HEIGHT
    self.caption = 'Game Of Life'
  end

  def needs_cursor?
    true
  end

  def update; end

  def draw
    draw_background

    (0..HEIGHT / CELL_SIZE).each do |y|
      (0..WIDTH / CELL_SIZE).each do |x|
        draw_cell(x, y)
      end
    end
  end

  def draw_background
    Gosu.draw_rect 0, 0, width, height, Colours::BLACK
  end

  def draw_cell(x, y)
    Gosu.draw_rect x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE - 1, CELL_SIZE - 1, Colours::DEAD_CELL
  end
end

GameOfLife.new.show
