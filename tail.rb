#!/usr/bin/env ruby

require 'debugger'

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

# Read in STDIN
input = STDIN.readlines

# Store number of input lines
file_size = input.size

# Store requested # of lines
requested_limit = get_limit

# Sanitize request. If the number of requested lines is greater than available
# ones, print what we have.
if file_size < requested_limit
  limit = file_size
else
  limit = requested_limit
end

# Set starting point to total number of lines minus limit
line_start = file_size - limit

# Create a range from starting point to end of file
line_range = line_start..file_size

# print each of those lines to STDOUT
input[line_range].each do |line|
  puts line
end
