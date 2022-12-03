# frozen_string_literal: true

require_relative '../common'

class Day02RockPaperScissors < Day
  GAME_SCORE = {
    'A' => {
      'Y' => 6,
      'X' => 3,
      'Z' => 0
    },
    'B' => {
      'Z' => 6,
      'Y' => 3,
      'X' => 0
    },
    'C' => {
      'X' => 6,
      'Z' => 3,
      'Y' => 0
    }
  }.freeze

  HAND_SCORE = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }.freeze

  PICK_RESPONSE = {
    'A' => {
      'X' => 'Z',
      'Y' => 'X',
      'Z' => 'Y'
    },
    'B' => {
      'X' => 'X',
      'Y' => 'Y',
      'Z' => 'Z'
    },
    'C' => {
      'X' => 'Y',
      'Y' => 'Z',
      'Z' => 'X'
    }
  }.freeze

  def part1
    lines.inject(0) do |res, line|
      (l, r) = line.strip.split(' ')

      res += HAND_SCORE[r] + GAME_SCORE[l][r] if l && r

      res
    end
  end

  def part2
    lines.inject(0) do |res, line|
      (l, r) = line.strip.split(' ')

      if l && r
        my_choice = PICK_RESPONSE[l][r]
        res += HAND_SCORE[my_choice] + GAME_SCORE[l][my_choice]
      end

      res
    end
  end
end
