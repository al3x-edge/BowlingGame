require_relative './spec_helper'

describe Game do
  let(:game) { Game.new }

  context "start of game" do
    it "has a score of 0 before the first ball has been rolled" do
      expect(game.score).to eq 0
    end

    it "begin with a frame of 1" do
      expect(game.current_frame).to eq 1
    end

    it "begins with ball number 1" do
      expect(game.current_ball).to eq 1
    end
  end

  context "one ball thrown with a score of 0" do
    it "has a score of 0" do
      game.throw_ball(0)
      expect(game.score).to eq 0
    end

    it "has a current frame of 1" do
      game.throw_ball(0)
      expect(game.current_frame).to eq 1
    end

    it "has a current ball of 2" do
      game.throw_ball(0)
      expect(game.current_ball).to eq 2
    end
  end

  context "two balls thrown scoring 0 and 5" do
    it "has a score of 5" do
      roll_array(game, [0,5])
      expect(game.score).to eq 5
    end

    it "has a current frame of 2" do
      roll_array(game, [0,5])
      expect(game.current_frame).to eq 2
    end

    it "has a current ball of 1" do
      roll_array(game, [0,5])
      expect(game.current_ball).to eq 1
    end
  end

  context "four balls thrown scoring 0,5,0 and 3" do
    it "has a score of 8" do
      roll_many(game, 4, 2)
      expect(game.score).to eq 8
    end

    it "has a current frame of 3" do
      roll_many(game, 4, 2)
      expect(game.current_frame).to eq 3
    end

    it "has a current ball of 1" do
      roll_many(game, 4, 2)
      expect(game.current_ball).to eq 1
    end
  end

  it "has a score of 24 with a strike and two balls thrown of 3 and 4" do
    roll_array(game, [10,0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
    expect(game.score).to eq 24
  end

  it "has a score of 20 with a spare and two balls thrown of 3 and 4" do
    roll_array(game, [5,5,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
    expect(game.score).to eq 20
  end

  def roll_many(game, times, score)
    for _ in (1..times)
      game.throw_ball(score)
    end
  end

  def roll_array(game, array)
    for score in array
      game.throw_ball(score)
    end
  end
end
