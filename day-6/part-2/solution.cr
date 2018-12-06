input = File.read("input.txt")

dimensions = 2500
grid = Array.new(dimensions) { |i| Array.new(dimensions) { |j| "" } }

grid_mapping = [] of NamedTuple(name: String, x: Int32, y: Int32)

alphabet = ("A".."ZZ").to_a

input.each_line.with_index do |line, index|
  parts = line.split(",")
  grid_mapping += [{ name: alphabet[index], x: parts[0].to_i, y: parts[1].to_i }]
end

#  puts grid_mapping
grid.each_with_index do |row, x|
  row.each_with_index do |col, y|
    x_off = x - (dimensions - 300)/2
    y_off = y - (dimensions - 290)/2

    mapping = grid_mapping.map { |parts| { name: parts[:name], count: ((parts[:x] - x_off).abs + (parts[:y] - y_off).abs) } }
    sum_match = mapping.sum { |x| x[:count] }
    # results = mapping.select { |x| x[:count] == min_match[:count] }
    # puts results.size

    if sum_match < 10000
      grid[y][x] = "OK"
    end
  end
end
#
# pp grid
#
# pp grid

flat_grid = grid.flatten
z = flat_grid.group_by { |x| x }.map { |x, y| [x, y.size] }.sort_by { |x| x.last.to_i }.to_h.select { |x, v| x != "" }
pp z#.select { |x, v| v.to_i < dimensions }#.sort_by { |x, v| v.to_i } #.max_by { |x,v| v.to_i }
