class Timer
  def initialize(milliseconds)
    @start = milliseconds
  end

  def self.zero
    Timer.new(0)
  end

  def should_tick?(delta)
    (delta - @start).to_f >= Config::TICK_SPEED_MS
  end

  def reset_to(milliseconds)
    @start = milliseconds
  end
end
