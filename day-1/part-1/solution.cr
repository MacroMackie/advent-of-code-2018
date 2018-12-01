input = File.read("input.txt")

frequency = 0

input.each_line do |line|
  frequency += line.to_i
end

puts "Result: #{frequency}"
frequency
