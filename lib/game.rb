class Game
  def initialize
    # Initially game score is set to 0
    @score = 0
    @throws = Array.new
    @total_throws = 0
  end

  def score
    score = 0

    for frame in 0..(@throws.length - 1)
      frameThrow = frame * 2
      if strike?(frameThrow)
        score += strike_score(frameThrow)
      elsif spare?(frameThrow)
        score += spare_score(frameThrow)
      else
        score += throw_score(frameThrow) + throw_score(frameThrow + 1)
      end
    end

    score
  end

  def current_frame
    (@throws.length / 2) + 1
  end

  def current_ball
    (@total_throws % 2) + 1
  end

  # Throw ball for a current frame
  def throw_ball(score=0)
    @score += score
    @total_throws += 1
    @throws << score
  end

  private
  def strike?(index)
    throw_score(index) == 10
  end

  def spare?(index)
    throw_score(index) + throw_score(index+1) == 10
  end

  def throw_score(index)
    return 0 if @throws[index].nil?
    return @throws[index]
  end

  # Return original 10 points and then combine points of next two ball rolls
  def strike_score(index)
    return 10 + throw_score(index+2) + throw_score(index+3)
  end

  # Return original 10 points and then combine points of next ball roll
  def spare_score(index)
    return 10 + throw_score(index+2)
  end
end
