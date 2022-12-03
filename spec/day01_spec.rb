require_relative '../day01/day01'

RSpec.describe Day01CaloriesCount do
  let(:input_lines) do
    data = <<~INPUT_DATA
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    INPUT_DATA

    data.split("\n")
  end

  subject { described_class.new(input_lines) }

  it 'part 1' do
    expect(subject.part1).to eq(24_000)
  end

  it 'part 2' do
    expect(subject.part2).to eq(45_000)
  end
end
