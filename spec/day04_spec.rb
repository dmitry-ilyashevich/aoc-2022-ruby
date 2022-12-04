# frozen_string_literal: true

require_relative '../day04/day04'

RSpec.describe Day04CampCleanup do
  let(:input_lines) do
    data = <<~INPUT_DATA
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(2)
  end

  it 'part 2' do
    expect(subject.part2).to eq(4)
  end
end
