input = File.read("input.txt")

# Array of ints at 0
dimensions = 1000
fabric_matrix = Array.new(dimensions) { |i| Array.new(dimensions) { |j| 0 } }

input.each_line do |line|
  tokens = line.delete(":").split
  x_space, y_space = tokens[2].split(",").map { |s| s.to_i }
  width, height = tokens[3].split("x").map { |s| s.to_i }

  (1..width).each_with_index do |_, i|
    (1..height).each_with_index do |_, j|
      fabric_matrix[x_space + i][y_space + j] += 1
    end
  end
end

# fabric_matrix.each do |line|
#   puts line
# end

res = fabric_matrix.reduce(0) do |acc, line|
  acc + line.count { |x| x > 1 }
end

puts res
