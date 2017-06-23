require 'set'
input = File.read("input.txt").split(",").map(&:strip)
@compass = [:N, :E, :S, :W]
@current = 0
@x = @y = 0
@visited = [].to_set


def move(steps, increment, x_or_y)
  steps.times do
    if @visited.include? [@x, @y]
      puts @x.abs + @y.abs
      exit
    else
      @visited.add [@x, @y]
      x_or_y == 'x' ? (@x += increment) : (@y += increment)
    end
  end
end

input.each do |input|
  left_right = input[0]
  steps = input[1..-1].to_i

  @current += (left_right == 'L' ? -1 : 1)
  @current %= 4

  case @compass[@current]
  when :N
    move(steps, 1, 'y')
  when :S
    move(steps, -1, 'y')
  when :E
    move(steps, 1, 'x')
  when :W
    move(steps, -1, 'x')
  end
end
