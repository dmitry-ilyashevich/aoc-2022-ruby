# frozen_string_literal: true

require_relative './day'

def input_file
  ARGV[0].nil? ? './input.txt' : ARGV[0]
end

def lines
  File.readlines(input_file)
end
