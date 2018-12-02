input = File.read("input.txt")

total_char_counts = [] of Int32
input.each_line do |line|
  char_counts = line.chars.group_by { |x| x }.map { |k, v| v.size }.uniq
  total_char_counts = total_char_counts + char_counts
end

twos = total_char_counts.count { |x| x == 2 }
threes = total_char_counts.count { |x| x == 3 }
result = twos * threes

puts "Result: #{result}"
result
