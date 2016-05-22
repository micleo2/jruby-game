require 'java'

def jColor
  java.awt.Color
end

def randomColor
  jColor.new rand(255), rand(255), rand(255)
end

class Circle
  attr_accessor :fillColor

  def initialize(x, y, r)
    @x = x
    @y = y
    @radius = r
    @fillColor = randomColor
    @vx = rand * 4 - 2
    @vy = rand * 4 - 2
  end

  def draw(g)
    g.setColor @fillColor
    g.fillOval @x - @radius, @y - @radius, @radius*2, @radius*2
  end

  def update(width, height)
    @x += @vx
    @y += @vy
    @vx *= -1 if (@x < @radius || @x > width - @radius)
    @vy *= -1 if (@y < @radius || @y > height - @radius)
  end
end
