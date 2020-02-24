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

  def test_a_single_live_cell_will_die_after_tick
    location = Location.new(1, 1)
    @world.add_at(location)

    @world.tick

    assert_equal(false, @world.alive_at?(location))
  end

  def test_a_cell_with_one_neighbour_does_not_survive_a_tick
    main_cell = Location.new(1, 1)
    first_neighbour_cell = Location.new(0, 1)
    @world.add_at(main_cell, first_neighbour_cell)

    @world.tick

    assert_equal(false, @world.alive_at?(main_cell))
  end

  def test_a_cell_with_two_neighbours_survives_a_tick
    main_cell = Location.new(1, 1)
    first_neighbour_cell = Location.new(0, 1)
    second_neighbour_cell = Location.new(1, 0)
    @world.add_at(main_cell, first_neighbour_cell, second_neighbour_cell)

    @world.tick

    assert_equal(true, @world.alive_at?(main_cell))
  end

  def test_a_cell_with_three_neighbours_survives_a_tick
    main_cell = Location.new(1, 1)
    first_neighbour_cell = Location.new(0, 1)
    second_neighbour_cell = Location.new(1, 0)
    third_neighbour_cell = Location.new(2, 1)
    @world.add_at(main_cell, first_neighbour_cell, second_neighbour_cell, third_neighbour_cell)

    @world.tick

    assert_equal(true, @world.alive_at?(main_cell))
  end

  def test_a_dead_cell_with_three_neighbours_is_born_after_a_tick
    dead_cell = Location.new(1, 1)
    first_neighbour_cell = Location.new(0, 1)
    second_neighbour_cell = Location.new(1, 0)
    third_neighbour_cell = Location.new(2, 1)
    @world.add_at(first_neighbour_cell, second_neighbour_cell, third_neighbour_cell)

    @world.tick

    assert_equal(true, @world.alive_at?(dead_cell))
  end
end
