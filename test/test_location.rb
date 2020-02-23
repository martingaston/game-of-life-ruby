# frozen_string_literal: true

require 'minitest/autorun'
require 'location'

class TestLocation < MiniTest::Test
  def test_a_location_knows_its_neighbours
    location = Location.new(1, 1)

    assert_equal(8, location.neighbours.length)
  end

  def test_neighbours_do_not_go_below_zero
    location = Location.new(0, 0)

    assert_equal(3, location.neighbours.length)
  end

  def test_a_location_can_detect_if_another_location_is_neighbouring
    location = Location.new(1, 1)
    neighbour = Location.new(2, 1)

    assert_equal(true, location.neighbour_of?(neighbour))
  end
end
