# frozen_string_literal: true

require_relative '../day07/day07'

RSpec.describe Day07NoSpaceLeftOnDevice do
  let(:input_lines) do
    data = <<~INPUT_DATA
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(95_437)
  end

  it 'part 2' do
    expect(subject.part2).to eq(24_933_642)
  end
end
