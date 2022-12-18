# frozen_string_literal: true

require_relative '../day18/day18'

RSpec.describe Day18BoilingBoulders do
  let(:input_lines) do
    data = <<~INPUT_DATA
      2,2,2
      1,2,2
      3,2,2
      2,1,2
      2,3,2
      2,2,1
      2,2,3
      2,2,4
      2,2,6
      1,2,5
      3,2,5
      2,1,5
      2,3,5
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(64)
  end

  it 'part 2' do
    expect(subject.part2).to eq(58)
  end
end
