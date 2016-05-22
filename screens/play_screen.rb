require 'java'
require_relative '../lib/pack2.jar'

java_import "Screen"
java_import "java.awt.Color"

class PlayScreen < Screen
  def initialize(gs, w, h)
    super(gs, w, h)
  end

  def start
  end

	def render(g)
    g.setColor Color.white
    Screen.drawCenteredString g, "new screen", self.getWidth/2, 50
  end

	def update()
  end

	def keyPressed(e)
  end

	def keyReleased(e)
  end

	def mousePressed(o)
  end

	def mouseReleased(o)
  end

	def mouseMoved(o)
  end

	def mouseDragged(o)
  end
end
