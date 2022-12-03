# frozen_string_literal: true

require_relative '../day03/day03'

RSpec.describe Day03RucksackReorganization do
  let(:input_lines) do
    data = <<~INPUT_DATA
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(157)
  end

  it 'part 2' do
    expect(subject.part2).to eq(70)
  end
end
