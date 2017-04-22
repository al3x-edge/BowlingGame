class Game
  def initialize
    # Initially game score is set to 0
    @score = 0
    # Game starts with a frame of 1
    @current_frame = 1
    # Each frame starts with ball 1 and progresses to 2
    @current_ball = 1

    @total_balls = 0

    @frames = [[0,0]]
  end

  def score
    @frames.inject(0){ |sum, frame| sum + frame[0] + frame[1] }
  end

  def current_frame
    @current_frame
  end

  def current_ball
    (@total_balls % 2) + 1
  end

  # Throw ball for a current frame
  def throw_ball(score=0)
    @frames[current_frame - 1][current_ball - 1] = score
    @score += score
    @total_balls += 1
    @current_frame += 1
  end


end
