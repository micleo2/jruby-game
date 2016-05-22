require 'java'
require_relative '../lib/pack2.jar'
require_relative '../game-elements/circle'
require_relative '../config'

java_import "Screen"
java_import "java.awt.event.KeyEvent"
java_import "java.awt.Color"

def randomColor
  Color.new rand(255), rand(255), rand(255)
end

class StartScreen < Screen
  NUM_CIRCLES = 20
  def initialize(gs, w, h)
    super(gs, w, h)
    @mouseColor = randomColor
    @circles = NUM_CIRCLES.times.map do
      nx = rand w - 30
      ny = rand h - 30
      Circle.new nx, ny, 20
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
    g.setColor Color.white
    Screen.drawCenteredString g, "Click to change colors", self.getWidth/2, 50
    Screen.drawCenteredString g, "Press s to start", self.getWidth/2, 70
  end

	def update()
    @circles.each do |x|
      x.update self.getWidth, self.getHeight
    end
  end
	def keyPressed(e)
    self.getState.setIndex Common::PLAY if e.getKeyCode == KeyEvent::VK_S
  end

  def keyReleased(e)
  end

	def mousePressed(o)
  end

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
