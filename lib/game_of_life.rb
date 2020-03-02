# frozen_string_literal: true

require 'gosu'
require_relative 'colours'
require_relative 'config'
require_relative 'world'
require_relative 'location'
require_relative 'timer'

class GameOfLife < Gosu::Window
  def initialize
    super Config::WIDTH, Config::HEIGHT
    self.caption = 'Game Of Life'
    @world = World.empty
    @timer = Timer.zero
  end

  def needs_cursor?
    true
  end

  def update
    @selected_x, @selected_y = get_mouseover_cell
    if Gosu.button_down? Gosu::MS_LEFT
      @world.add_at(Location.new(@selected_x, @selected_y))
    end

    return unless should_tick?

    @world.tick
    @timer.reset_to(Gosu.milliseconds)
  end

  def should_tick?
    @timer.should_tick?(Gosu.milliseconds) && Gosu.button_down?(Gosu::KB_SPACE)
  end

  def draw
    draw_background
    populate
  end

  def draw_background
    Gosu.draw_rect 0, 0, width, height, Colours::BLACK
  end

  def populate
    (0..CELLS_HEIGHT).each do |y|
      (0..CELLS_WIDTH).each do |x|
        if [x, y] == [@selected_x, @selected_y]
          draw_cell(x, y, Colours::WHITE)
        else
          draw_cell(x, y, get_cell_colour(x, y))
        end
      end
    end
  end

  def draw_cell(x, y, colour)
    size = Config::CELL_SIZE - 1
    start_x = x * Config::CELL_SIZE
    start_y = y * Config::CELL_SIZE
    Gosu.draw_rect start_x, start_y, size, size, colour
  end

  def get_mouseover_cell
    location_x = (mouse_x / Config::CELL_SIZE).to_i
    location_y = (mouse_y / Config::CELL_SIZE).to_i

    [clamp_horizontal(location_x), clamp_vertical(location_y)]
  end

  def clamp_horizontal(x)
    x.clamp(0, Config::CELLS_WIDTH)
  end

  def clamp_vertical(y)
    y.clamp(0, Config::CELLS_HEIGHT)
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
