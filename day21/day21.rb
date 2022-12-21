# frozen_string_literal: true

require_relative '../common'

class Day21MonkeyMath < Day
  def part1
    evaluate(expressions['root'])
  end

  def part2
    expressions
    @expressions['humn'] = 'x'

    left, _op, right = evaluate(@expressions['root'])
    humn, other = left.is_a?(Numeric) ? [right, left] : [left, right]

    while humn != 'x'
      left, op, right = humn

      humn, other2 = left.is_a?(Numeric) ? [right, left] : [left, right]

      case op
      when '*'
        other /= other2
      when '+'
        other -= other2
      when '-'
        if left == humn
          other += other2
        else
          other = other2 - other
        end
      when '/'
        if left == humn
          other *= other2
        else
          other = other2 / other
        end
      end
    end

    other
  end

  private

  def expressions
    @expressions ||= lines.each_with_object({}) do |line, res|
      val, expr = line.strip.split(': ')

      res[val] = expr
    end
  end

  def evaluate(expression)
    return expression if expression == 'x'
    return expression.to_i if expression.to_i.positive?

    left, op, right = expression.split(' ')

    left = evaluate(@expressions[left])
    right = evaluate(@expressions[right])

    return [left, op, right] if !left.is_a?(Numeric) || !right.is_a?(Numeric)

    case op
    when '*'
      left * right
    when '/'
      left / right
    when '+'
      left + right
    when '-'
      left - right
    else
      false
    end
  end
end
