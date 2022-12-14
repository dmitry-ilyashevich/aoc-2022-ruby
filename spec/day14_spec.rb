# frozen_string_literal: true

require_relative '../day14/day14'

RSpec.describe Day14RegolithReservoir do
  let(:input_lines) do
    data = <<~INPUT_DATA
      498,4 -> 498,6 -> 496,6
      503,4 -> 502,4 -> 502,9 -> 494,9
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(24)
  end

  it 'part 2' do
    expect(subject.part2).to eq(93)
  end
end
