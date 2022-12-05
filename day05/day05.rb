# frozen_string_literal: true

require_relative '../common'

class Day05SupplyStacks < Day
  def initialize(lines)
    super(lines)
    load_moves
    load_stacks
  end

  def part1
    @moves.each do |move|
      count, from, to = move

      count.to_i.times do
        val = @stacks[from.to_i - 1].shift
        @stacks[to.to_i - 1].unshift val
      end
    end

    @stacks.map { |row| row[0] }.join('')
  end

  def part2
    @moves.each do |move|
      count, from, to = move

      vals = @stacks[from.to_i - 1].shift(count.to_i)
      vals.reverse.each do |val|
        @stacks[to.to_i - 1].unshift val
      end
    end

    @stacks.map { |row| row[0] }.join('')
  end

  private

  def stack_columns
    @stack_columns ||= lines[stack_rows].split(' ').compact.last.to_i
  end

  def stack_rows
    @stack_rows ||= begin
      index = 0
      index += 1 while lines[index] =~ /\[.\]/
      index
    end
  end

  def load_stacks
    @stacks = Array.new(stack_columns) { [] }

    lines[0...stack_rows].each do |line|
      0.step.take(stack_columns).each do |i|
        value = line[i * 4 + 1]
        @stacks[i].push value if value && value != ' '
      end
    end
  end

  def load_moves
    @moves = lines.each_with_object([]) do |line, res|
      m = line.match(/move (\d+) from (\d+) to (\d+)/)

      res << m[1..] unless m.nil?
      res
    end
  end
end
