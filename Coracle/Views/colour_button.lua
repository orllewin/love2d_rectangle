--[[
	

	
]]--

require "Coracle/coracle"
require "Coracle/Views/view_utils"
require "Coracle/colour"
require "Coracle/Shapes/rectangle"

class('ColourButton').extends()

function ColourButton:init(label, colour, x, y, width, height, onClick)
	ColourButton.super.init()
	
	self.colour = colour
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.onClick = onClick
	
	self.yOffset = 0

	self.canvas = love.graphics.newCanvas(width, height)
	love.graphics.setCanvas(self.canvas)
	love.graphics.setColor(rgb(colour)) 
	

	coracle.graphics.rectangle('fill', 0, 0, width, height, 5)
	coracle.graphics.rectangle('line', 0, 0, width, height, 5)
	
	love.graphics.setColor(rgb("#ffffff")) 
	local font = love.graphics.getFont()
	local labelWidth = font:getWidth(label)
	love.graphics.print(label, width/2 - (labelWidth/2), height/2 - (font:getHeight()/2) -1)
	love.graphics.setColor(white()) --reset colour?
	love.graphics.setCanvas() 	
end

function ColourButton:contains(x, y)
	return inBounds(x, y, self.x + (self.width/2), self.y + (self.height/2), self.width, self.height)
end

function ColourButton:clickDown()
	self.yOffset = 2
end

function ColourButton:clickUp()
	self.yOffset = 0
	if self.onClick ~= nil then self.onClick() end
end

function ColourButton:draw()
	love.graphics.draw(self.canvas, self.x, self.y + self.yOffset)
end