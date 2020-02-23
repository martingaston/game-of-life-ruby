# frozen_string_literal: true

require 'minitest/autorun'
require 'world'
require 'location'

class WorldTest < MiniTest::Test
  def setup
    @world = World.empty
  end

  def test_an_empty_world_is_empty_after_tick
    @world.tick

    assert_equal(@world.empty?, true)
  end

  def test_a_world_with_one_cell_is_not_empty_after_tick
    location = Object.new
    @world.add_at(location)

    @world.tick

    assert_equal(@world.empty?, false)
  end

  def test_a_single_live_cell_will_die_after_tick
    location = Object.new
    @world.add_at(location)

    @world.tick

    assert_equal(@world.alive_at?(location), false)
  end

  def test_a_cell_with_two_neighbours_survives_a_tick
    main_cell = Location.new(1, 1)
    first_neighbour_cell = Location.new(0, 1)
    second_neighbour_cell = Location.new(1, 0)
    @world.add_at(main_cell, first_neighbour_cell, second_neighbour_cell)

    @world.tick

    assert_equal(@world.alive_at?(main_cell), true)
  end
end
