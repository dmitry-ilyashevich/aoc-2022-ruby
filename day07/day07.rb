# frozen_string_literal: true

require_relative '../common'

class Day07NoSpaceLeftOnDevice < Day
  def part1
    sizes.values.inject(0) do |res, size|
      res += size if size < 100_000
      res
    end
  end

  def part2
    need_to_free = sizes['/'] - 40_000_000

    sizes.values.inject(1_000_000_000) do |res, size|
      res = [res, size].min if size > need_to_free
      res
    end
  end

  private

  def sizes
    return @sizes if @sizes

    path = []
    @sizes = Hash.new(0)

    lines.each do |line|
      words = line.strip.split(' ')

      if words[1] == 'cd'
        if words[2] == '..'
          path.pop
        else
          path.push(words[2])
        end
      elsif words[1] == 'ls' || words[0] == 'dir'
        next
      else
        file_size = words[0].to_i
        (1..path.size).each do |index|
          sizes[path[0...index].join('/')] += file_size
        end
      end
    end

    @sizes
  end
end
