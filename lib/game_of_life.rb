# frozen_string_literal: true

require 'gosu'
require_relative 'colours'
require_relative 'config'
require_relative 'world'
require_relative 'location'

class GameOfLife < Gosu::Window
  def initialize
    super Config::WIDTH, Config::HEIGHT
    self.caption = 'Game Of Life'
    @world = World.empty
  end

  def needs_cursor?
    true
  end

  def update
    @world.tick if Gosu.button_down? Gosu::KB_SPACE
    @selected_x, @selected_y = get_mouseover_cell

    if Gosu.button_down? Gosu::MS_LEFT
      @world.add_at(Location.new(@selected_x, @selected_y))
    end
  end

  def draw
    draw_background
    puts Gosu.fps

    (0..Config::HEIGHT / Config::CELL_SIZE).each do |y|
      (0..Config::WIDTH / Config::CELL_SIZE).each do |x|
        if [x, y] == [@selected_x, @selected_y]
          draw_selected_cell(x, y)
        else
          draw_cell(x, y)
        end
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
    colour = get_cell_colour(x, y)
    Gosu.draw_rect start_x, start_y, size, size, colour
  end

  def draw_selected_cell(x, y)
    size = Config::CELL_SIZE - 1
    start_x = x * Config::CELL_SIZE
    start_y = y * Config::CELL_SIZE
    Gosu.draw_rect start_x, start_y, size, size, Colours::WHITE
  end

  def get_mouseover_cell
    location_x = (mouse_x / Config::CELL_SIZE).to_i
    location_y = (mouse_y / Config::CELL_SIZE).to_i

    [location_x, location_y]
  end

  def get_cell_colour(x, y)
    location = Location.new(x, y)
    if @world.alive_at?(location)
      Colours::LIVE_CELL
    else
      Colours::DEAD_CELL
    end
  end
end

GameOfLife.new.show
