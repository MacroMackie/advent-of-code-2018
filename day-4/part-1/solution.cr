input = File.read("input.txt")


guard_sleep_times = {} of String => Array(Int32)

guard_on_duty = "#0"
guard_asleep_start = 0

line_mapping = [] of String

input.each_line do |line|
  line_mapping += [line]
end

line_mapping.sort.each do |line|
  year = line[1..4]
  month = line[6..7]
  day = line[9..10]
  hour = line[12..13]
  minute = line[15..16]

  target = line[18..-1].split(" ")[2].to_s

  # puts guard_on_duty

  if target.includes?("#")
    guard_on_duty = target.to_s.delete("#")
    next
  end

  if target == "asleep"
    guard_asleep_start = minute
  end

  if target == "up"
    guard_sleep_times[guard_on_duty] ||= [] of Int32

    guard_asleep_start ||= 999999

    time_array = [] of Int32
    time_array += (guard_asleep_start.to_i...minute.to_i).to_a

    # time_array = (guard_asleep_start..minute).to_a
    guard_sleep_times[guard_on_duty] += time_array
  end
end

# sleepy_match = guard_sleep_times.max_by { |k,v| v.size }
# sleepy_guard = sleepy_match.first
# sleepy_arr = sleepy_match.last

maxes = {} of String => Array(Int32)

z = guard_sleep_times.max_by do |k,v|
  minote = v.max_by { |x| v.count(x) }
  max_count = v.count(minote)
  puts "#{k} => #{minote} [#{max_count} times]"
  # puts zz
  maxes[k] = [minote, max_count]
  max_count
end

puts z.first
puts maxes[z.first]
puts guard_sleep_times["2879"].count(50)

# puts guard_sleep_times['']
# sleepy_val = sleepy_arr.max_by { |x| sleepy_arr.count(x) }

# puts z
# puts guard_sleep_times
# puts sleepy_guard
# puts sleepy_val
# puts sleepy_guard.to_i * sleepy_val
