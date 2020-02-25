# frozen_string_literal: true

require 'gosu'
require_relative 'colours'
require_relative 'config'

class GameOfLife < Gosu::Window
  def initialize
    super Config::WIDTH, Config::HEIGHT
    self.caption = 'Game Of Life'
  end

  def needs_cursor?
    true
  end

  def update; end

  def draw
    draw_background

    (0..Config::HEIGHT / Config::CELL_SIZE).each do |y|
      (0..Config::WIDTH / Config::CELL_SIZE).each do |x|
        draw_cell(x, y)
      end
    end
  end

  def draw_background
    Gosu.draw_rect 0, 0, width, height, Colours::BLACK
  end

  def draw_cell(x, y)
    size = Config::CELL_SIZE - 1
    start_x = x * Config::CELL_SIZE
    start_y = y * Config::CELL_SIZE
    Gosu.draw_rect start_x, start_y, size, size, Colours::DEAD_CELL
  end
end

GameOfLife.new.show
