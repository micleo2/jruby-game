require 'java'
require_relative 'lib/pack.jar'
require_relative 'circle'

java_import "Screen"

def jColor
  java.awt.Color
end

def randomColor
  jColor.new rand(255), rand(255), rand(255)
end

class StartScreen < Screen
  NUM_CIRCLES = 20
  def initialize(gs, w, h)
    super(gs, w, h)
    @x = 0
    @mouseColor = randomColor
    @circles = []
    @w = w
    @h = h
    NUM_CIRCLES.times do
      nx = rand w - 30
      ny = rand h - 30
      @circles.push(Circle.new nx, ny, 20)
    end
  end

  def start
  end

	def render(g)
    g.setColor @mouseColor
    g.fillOval @mouseX.to_i, @mouseY.to_i, 15, 15
    @circles.each do |x|
      x.draw g
    end
    g.setColor jColor.white
    Screen.drawCenteredString g, "Click to change colors", @w/2, 50
  end

	def update()
    @circles.each do |x|
      x.update @w, @h
    end
  end

  #INHERITED FROM ABSTRACT SCREEN CLASS
	def keyPressed(e)    ;end
	def keyReleased(e)   ;end
	def mousePressed(o)  ;end

	def mouseReleased(o)
    @mouseColor = randomColor
    @circles.each do |c|
      c.fillColor = randomColor
    end
  end

	def mouseMoved(o)
    @mouseX = o.getX()
    @mouseY = o.getY()
  end

	def mouseDragged(o)  ;end
end
