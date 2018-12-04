input = File.read("input.txt")

# Array of ints at 0
dimensions = 1000
fabric_matrix = Array.new(dimensions) { |i| Array.new(dimensions) { |j| "" } }

input.each_line do |line|
  tokens = line.delete(":").split
  claim_id = tokens[0]
  x_space, y_space = tokens[2].split(",").map { |s| s.to_i }
  width, height = tokens[3].split("x").map { |s| s.to_i }

  (1..width).each_with_index do |_, i|
    (1..height).each_with_index do |_, j|
      fabric_matrix[x_space + i][y_space + j] += claim_id
    end
  end
end

# fabric_matrix.each do |line|
#   puts line
# end

def check_token(fabric_matrix, x, y, w, h)
  (1..w).each_with_index do |_, i|
    (1..h).each_with_index do |_, j|
      return false if fabric_matrix[x + i][y + j].count("#") > 1
    end
  end

  return true
end

def find_match(input, fabric_matrix)
  input.each_line do |line|
    tokens = line.delete(":").split
    claim_id = tokens[0]
    x_space, y_space = tokens[2].split(",").map { |s| s.to_i }
    width, height = tokens[3].split("x").map { |s| s.to_i }

    check = check_token(fabric_matrix, x_space, y_space, width, height)
    return claim_id if check
  end

  return false
end

res = find_match(input, fabric_matrix)

puts res
