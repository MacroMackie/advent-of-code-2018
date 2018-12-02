def run_loop
  input = File.read("input.txt")

  input.each_line do |target|
    input.each_line do |comparison|
      diffs = 0

      target.chars.each_with_index do |tc, ix|
        if (tc != comparison[ix])
          diffs += 1
          break if (diffs > 1)
        end
      end

      return [target, comparison] if diffs == 1
    end
  end
end

result = run_loop
puts "Result #{result}"
