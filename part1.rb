input = File.read("input.txt").split.map(&:strip)
compass = [:N, :E, :S, :W]
current = :N
position = [0, 0]

input.each do |input|
  left_right = input[0]
  steps = input[1..-1].to_i

  if left_right == 'L'
    current = compass[compass.index(current) - 1]
  else
    current = compass[(compass.index(current) + 1) % 4]
  end

  if current == :N
    position[1] += steps
  elsif current == :S
    position[1] -= steps
  elsif current == :E
    position[0] += steps
  elsif current == :W
    position[0] -= steps
  end
end

distance = position[0].abs + position[1].abs
puts distance
