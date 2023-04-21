class('Label').extends()

function Label:init(label, x, y)
	Label.super.init()
	
	self.x = x
	self.y = y
	
	local font = love.graphics.getFont()
	local width = font:getWidth(label)
	local height = font:getHeight()
	
	self.canvas = love.graphics.newCanvas(width, height)
	love.graphics.setCanvas(self.canvas)
	love.graphics.push()
	love.graphics.print(label, 0, 0)
	love.graphics.pop()
	love.graphics.setCanvas()
end

function Label:draw()
	love.graphics.draw(self.canvas, self.x, self.y)
end