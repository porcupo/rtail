#!/usr/bin/env ruby

def print_usage
  # Print out help for script.
  puts "#{$PROGRAM_NAME}: print the last N lines of a file. (Default: 10 lines)"
  puts "Usage:   #{$PROGRAM_NAME} [lines]"
  puts "Example: #{$PROGRAM_NAME} 20"
end

def get_limit
  # Determines number of lines to print
  # Also checks syntax of commandline args
  if ARGV.empty?
    # No arguments: use default value of 10 lines.
    nr_lines = 10
  elsif (ARGV[0] && Integer(ARGV[0]) rescue false)
    # First arguement is specified and is an integer: use this value for 
    # number of lines. Ignore any other arguments.
    nr_lines = ARGV[0].to_i
  else
    # Argument is there but not an integer. Assuming user needs assistance.
    print_usage
    exit 1
  end
end

def check_limit(file_size,limit)
  # Check to ensure limit is not more than number of lines in the input.
  # if so, print all lines in input
  if file_size < limit
    return limit
  end
end

# Read in STDIN
input = STDIN.readlines
require 'debugger'
# Store number of input lines
file_size = input.size
puts 'file size'
p file_size
limit = get_limit
puts 'limit'
p limit
debugger
limit2 = check_limit(file_size,limit)
puts 'limit2'
p limit2
exit
# Store sanitized limit
limit = set_limit
limit = check_limit(file_size,limit)

p file_size
p limit

# Set starting point to total number of lines minus limit
line_start = file_size - limit

# Create a range from starting point to end of file
line_range = line_start..input.size

# print each of those lines to STDOUT
input[line_range].each do |line|
  puts line
end
