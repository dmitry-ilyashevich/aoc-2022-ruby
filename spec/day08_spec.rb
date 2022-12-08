# frozen_string_literal: true

require_relative '../day08/day08'

RSpec.describe Day08TreetopTreeHouse do
  let(:input_lines) do
    data = <<~INPUT_DATA
      30373
      25512
      65332
      33549
      35390
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(21)
  end

  it 'part 2' do
    expect(subject.part2).to eq(8)
  end
end
