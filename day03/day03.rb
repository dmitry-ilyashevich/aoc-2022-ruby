# frozen_string_literal: true

require_relative '../common'

class Day03RucksackReorganization < Day
  def part1
    lines.inject(0) do |res, line|
      line.strip!
      line_size = line.size
      common_item = intersection([line.slice(0, line_size / 2), line.slice(line_size / 2, line_size)])

      res += weight_of_item(common_item[0].to_s) unless common_item.empty?
      res
    end
  end

  def part2
    lines.each_slice(3).inject(0) do |res, group|
      common_item = intersection(group.map(&:strip))

      res += weight_of_item(common_item) if group.size == 3 && !common_item.empty?
      res
    end
  end

  private

  def weight_of_item(value)
    ascii_code = value.ord
    ascii_code > 90 ? ascii_code - 96 : ascii_code - 64 + 26
  end

  def intersection(items)
    return [] if items.empty?

    items.inject(items[0].split('')) do |res, item|
      res & item.split('')
    end.join('')
  end
end
