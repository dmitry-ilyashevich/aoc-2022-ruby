# frozen_string_literal: true

require_relative '../common'

class Day09RopeBridge < Day
  MOVES = {
    'R' => [1, 0],
    'U' => [0, -1],
    'D' => [0, 1],
    'L' => [-1, 0]
  }.freeze

  def part1
    head = [0, 0]
    tail = [0, 0]
    marks = {}

    lines.each do |line|
      direction, steps = line.strip.split(' ')

      steps.to_i.times do
        head[0] += MOVES[direction][0]
        head[1] += MOVES[direction][1]

        tail = follow(head, tail)
        marks[tail[0]] ||= {}
        marks[tail[0]][tail[1]] = true
      end
    end

    marks.values.map(&:size).sum
  end

  def part2
    head = [0, 0]
    tail = Array.new(9) { [0, 0] }
    marks = {}

    lines.each do |line|
      direction, steps = line.strip.split(' ')

      steps.to_i.times do
        head[0] += MOVES[direction][0]
        head[1] += MOVES[direction][1]

        tail[0] = follow(head, tail[0])
        8.times do |i|
          tail[i + 1] = follow(tail[i], tail[i + 1])
        end
        marks[tail[8][0]] ||= {}
        marks[tail[8][0]][tail[8][1]] = true
      end
    end

    marks.values.map(&:size).sum
  end

  private

  def follow(head, tail)
    dx = (head[0] - tail[0])
    dy = (head[1] - tail[1])

    if dx.abs >= 2 && dy.abs >= 2
      tail[0] = tail[0] < head[0] ? head[0] - 1 : head[0] + 1
      tail[1] = tail[1] < head[1] ? head[1] - 1 : head[1] + 1
    elsif dx.abs >= 2
      tail[0] = tail[0] < head[0] ? head[0] - 1 : head[0] + 1
      tail[1] = head[1]
    elsif dy.abs >= 2
      tail[0] = head[0]
      tail[1] = tail[1] < head[1] ? head[1] - 1 : head[1] + 1
    end

    tail
  end
end
