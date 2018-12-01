def run_loop
  input = File.read("input.txt")
  frequency = 0
  matches = {} of Int32 => Bool

  loop do
    input.each_line do |line|
      frequency += line.to_i
      return frequency if matches[frequency]?
      matches[frequency] = true
    end
  end
end

result = run_loop
puts "Result: #{result}"
result
