require_relative './spec_helper'

describe Game do
  context "start of game" do
    let(:game) { Game.new }

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

  context "frame progression" do
    let(:game) { Game.new }

    it "allows balls to be thrown for a score" do
      game.throw_ball(0)
      expect(game.score).to eq 0
    end

    it "notes balls thrown of 2 after throwing first ball" do
      game.throw_ball(0)
      expect(game.current_ball).to eq 2
    end

    it "allow two balls to be thrown with a current score of 5" do
      game.throw_ball(0)
      game.throw_ball(5)

      expect(game.current_ball).to eq 1
      expect(game.current_frame).to eq 2
      expect(game.score).to eq 5
    end
  end
end
