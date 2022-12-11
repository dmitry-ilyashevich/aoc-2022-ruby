# frozen_string_literal: true

require_relative '../common'

class Day11MonkeyInTheMiddle < Day
  def initialize(lines)
    super(lines)
    @data = parse_commands
  end

  def part1
    counter = Array.new(@data.size) { 0 }

    20.times do
      @data.each.with_index do |command, index|
        command[:numbers].each do |item|
          counter[index] += 1
          item = item.public_send(
            command[:operation],
            command[:argument] == 'old' ? item : command[:argument].to_i
          ) / 3

          if (item % command[:test]).zero?
            @data[command[:true_index]][:numbers].append(item)
          else
            @data[command[:false_index]][:numbers].append(item)
          end

          @data[index][:numbers] = []
        end
      end
    end

    counter.sort[-2..].reduce(&:*)
  end

  def part2
    counter = Array.new(@data.size) { 0 }

    10_000.times do
      @data.each.with_index do |command, index|
        command[:numbers].each do |item|
          counter[index] += 1
          item = item.public_send(
            command[:operation],
            command[:argument] == 'old' ? item : command[:argument].to_i
          ) % lcm

          if (item % command[:test]).zero?
            @data[command[:true_index]][:numbers].append(item)
          else
            @data[command[:false_index]][:numbers].append(item)
          end

          @data[index][:numbers] = []
        end
      end
    end

    counter.sort[-2..].reduce(&:*)
  end

  private

  def lcm
    @lcm ||= @data.map { |command| command[:test] }.reduce(&:*)
  end

  def parse_commands
    commands = lines.join('').split("\n\n").map { |group| group.split("\n") }

    commands.each_with_object([]) do |command, res|
      numbers = command[1].match(/\d+(,\s\d+)*/)[0].split(', ').map(&:to_i)
      operation = command[2].match(%r{[*+\-/]})[0]
      argument = command[2].match(/(\d+|old)$/)[0]
      test = command[3].match(/\d+/)[0].to_i
      true_index = command[4].match(/\d+/)[0].to_i
      false_index = command[5].match(/\d+/)[0].to_i

      res << { numbers:, operation:, argument:, test:, true_index:, false_index: }
    end
  end
end
