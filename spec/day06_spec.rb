# frozen_string_literal: true

require_relative '../day06/day06'

RSpec.describe Day06TuningTroubles do
  let(:input_lines) do
    data = <<~INPUT_DATA
      mjqjpqmgbljsphdztnvjfqwrcgsmlb
      bvwbjplbgvbhsrlpgdmjqwftvncz
      nppdvjthqldpwncqszvftbrmjlhg
      nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
      zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to match_array([7, 5, 6, 10, 11])
  end

  it 'part 2' do
    expect(subject.part2).to eq([19, 23, 23, 29, 26])
  end
end
