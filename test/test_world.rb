# frozen_string_literal: true

require 'minitest/autorun'
require 'world'

class WorldTest < MiniTest::Test
  def test_an_empty_world_is_empty
    world = World.empty

    assert_equal(world.empty?, true)
  end

  def test_adding_to_the_world_makes_it_not_empty
    world = World.empty
    location = Object.new

    world.add_at(location)

    assert_equal(world.empty?, false)
  end
end
