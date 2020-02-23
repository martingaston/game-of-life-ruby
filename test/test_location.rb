# frozen_string_literal: true

require 'minitest/autorun'
require 'location'

class TestLocation < MiniTest::Test
  def check_all_neighbours(location, neighbours)
    neighbours.each do |x, y|
      neighbour = Location.new(x, y)
      assert_equal(true, location.neighbour_of?(neighbour))
    end
  end

  def test_a_location_can_detect_if_another_location_is_neighbouring
    location = Location.new(1, 1)
    neighbouring_locations = [
      [0, 0], [1, 0], [2, 0],
      [0, 1], [2, 1],
      [0, 2], [1, 2], [2, 2]
    ]

    check_all_neighbours(location, neighbouring_locations)
  end

  def test_a_location_can_detect_if_a_location_is_not_neighbouring
    location = Location.new(1, 1)
    neighbour = Location.new(3, 1)

    assert_equal(false, location.neighbour_of?(neighbour))
  end
end
