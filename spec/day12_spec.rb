# frozen_string_literal: true

require_relative '../day12/day12'

RSpec.describe Day12HillClimbingAlgorithm do
  let(:input_lines) do
    data = <<~INPUT_DATA
      Sabqponm
      abcryxxl
      accszExk
      acctuvwj
      abdefghi
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(31)
  end

  it 'part 2' do
    expect(subject.part2).to eq(29)
  end
end
