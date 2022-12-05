# frozen_string_literal: true

require_relative '../day05/day05'

RSpec.describe Day05SupplyStacks do
  let(:input_lines) do
    data = <<~INPUT_DATA
          [D]
      [N] [C]
      [Z] [M] [P]
       1   2   3

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq('CMZ')
  end

  it 'part 2' do
    expect(subject.part2).to eq('MCD')
  end
end
