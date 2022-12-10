# frozen_string_literal: true

require_relative '../common'

class Day10CathodeRayTube < Day
  def part1
    acc = 0
    value = 1
    ticks = 0

    lines.each do |line|
      words = line.strip.split(' ')

      case words[0]
      when 'noop'
        ticks += 1
        acc += flush_to_acc1(ticks, value)
      when 'addx'
        ticks += 1
        acc += flush_to_acc1(ticks, value)
        ticks += 1
        acc += flush_to_acc1(ticks, value)
        value += words[1].to_i
      end
    end

    acc
  end

  def part2
    acc = Array.new(6) { Array.new(40) }
    value = 1
    ticks = 0

    lines.each do |line|
      words = line.strip.split(' ')

      case words[0]
      when 'noop'
        ticks += 1
        acc = flush_to_acc2(acc, ticks, value)
      when 'addx'
        ticks += 1
        acc = flush_to_acc2(acc, ticks, value)
        ticks += 1
        acc = flush_to_acc2(acc, ticks, value)
        value += words[1].to_i
      end
    end

    acc.map { |row| row.join('') }.join("\n")
  end

  private

  def flush_to_acc1(ticks, value)
    return ticks * value if [20, 60, 100, 140, 180, 220].include? ticks

    0
  end

  def flush_to_acc2(acc, ticks, value)
    index = ticks - 1

    acc[index / 40][index % 40] = (value - (index % 40)).abs <= 1 ? '#' : ' '
    acc
  end
end
