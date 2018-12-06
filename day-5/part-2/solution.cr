input = File.read("input.txt")

alphabet = ('a'..'z').to_a

def process_chars(chars : Array(Char))
  chars.each_with_index do |char, index|
    next if index == 0

    first_char = chars[index-1]
    second_char = chars[index]

    if first_char != second_char && first_char.downcase == second_char.downcase
      chars = chars[0, index-1] + chars[index+1, chars.size]
      return { chars: chars, flag: false }
    end
  end

  return { chars: chars, flag: true }
end


final = alphabet.reduce({} of String => Char) do |acc, letter|
  result = {
    chars: input.lines.first.delete(letter.to_s.downcase).delete(letter.to_s.upcase).chars,
    flag: false
  }

  loop do
    result = process_chars(result[:chars])
    break if result[:flag]
  end

  acc.merge({ letter => result[:chars].size })
end

z = final.min_by do |x|
  x.to_a[1].to_i
end

puts z
