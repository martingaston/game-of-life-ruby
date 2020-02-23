require 'minitest/autorun'
require 'cell'

class CellTest < MiniTest::Test
  def test_dead_cell_stays_dead
    cell = Cell.dead

    refute(cell.alive?)
  end

  def test_alive_cell_dies_without_neighbours
    cell = Cell.alive

    cell.tick

    refute(cell.alive?)
  end
end
