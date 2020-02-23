class Cell
  ALIVE = "alive"
  DEAD = "dead"

  def initialize(status)
    @status = status
  end

  def self.dead
    Cell.new(DEAD)
  end

  def self.alive
    Cell.new(ALIVE)
  end

  def tick
    @status = DEAD
  end

  def alive?
    return true if @status == ALIVE
    return false if @status == DEAD

    raise("Invalid cell status")
  end
end
