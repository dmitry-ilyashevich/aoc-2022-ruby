# frozen_string_literal: true

require_relative '../day11/day11'

RSpec.describe Day11MonkeyInTheMiddle do
  let(:input_lines) do
    data = <<~INPUT_DATA
      Monkey 0:
        Starting items: 79, 98
        Operation: new = old * 19
        Test: divisible by 23
          If true: throw to monkey 2
          If false: throw to monkey 3

      Monkey 1:
        Starting items: 54, 65, 75, 74
        Operation: new = old + 6
        Test: divisible by 19
          If true: throw to monkey 2
          If false: throw to monkey 0

      Monkey 2:
        Starting items: 79, 60, 97
        Operation: new = old * old
        Test: divisible by 13
          If true: throw to monkey 1
          If false: throw to monkey 3

      Monkey 3:
        Starting items: 74
        Operation: new = old + 3
        Test: divisible by 17
          If true: throw to monkey 0
          If false: throw to monkey 1
    INPUT_DATA

    data.split("\n").map! { |line| "#{line}\n" }
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(10_605)
  end

  it 'part 2' do
    expect(subject.part2).to eq(2_713_310_158)
  end
end
