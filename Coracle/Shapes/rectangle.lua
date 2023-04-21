class('Rectangle').extends()

function Rectangle:init(mode, x, y, width, height, corner)
	Rectangle.super.init()
	
	self.mode = mode
	self.x = x
	self.y = y
	
	if corner == nil then
		corner = 0
	end
	
	self.vertices = {}
	
	local tau = 6.2831855
	local d = math.min(width, height)
	local hOffset = 0
	
	if width > d then
		hOffset = (width - d)/2
	end
	
	--top left
	for i=tau/2,tau - tau/4,tau/50 do
		local c = math.cos(i)
		local s = math.sin(i)
		
		local vX = (width/2 - hOffset) + (math.abs(c)^(2.0/corner)) * d/2 * self:sign(c)
		local vY = height/2 + (math.abs(s)^(2.0/corner)) * d/2 * self:sign(s)
		
		table.insert(self.vertices, vX)
		table.insert(self.vertices, vY)
	end
	
	--top right		
	for i=tau - tau/4,tau,tau/50 do
		local c = math.cos(i)
		local s = math.sin(i)
		
		local vX = (width/2 + hOffset) + (math.abs(c)^(2.0/corner)) * d/2 * self:sign(c)
		local vY = height/2 + (math.abs(s)^(2.0/corner)) * d/2 * self:sign(s)
		
		table.insert(self.vertices, vX)
		table.insert(self.vertices, vY)
	end
	
	--bottom right	
	for i=0,tau/4,tau/50 do
		local c = math.cos(i)
		local s = math.sin(i)
		
		local vX = (width/2 + hOffset) + (math.abs(c)^(2.0/corner)) * d/2 * self:sign(c)
		local vY = height/2 + (math.abs(s)^(2.0/corner)) * d/2 * self:sign(s)
		
		table.insert(self.vertices, vX)
		table.insert(self.vertices, vY)
	end
	
	--bottom left
	for i=tau/4,tau/2,tau/50 do
		local c = math.cos(i)
		local s = math.sin(i)
		
		local vX = (width/2 - hOffset) + (math.abs(c)^(2.0/corner)) * d/2 * self:sign(c)
		local vY = height/2 + (math.abs(s)^(2.0/corner)) * d/2 * self:sign(s)
		
		table.insert(self.vertices, vX)
		table.insert(self.vertices, vY)
	end

	local lineWidth = love.graphics.getLineWidth()
	self.canvasOffset = lineWidth/2
	self.canvas = love.graphics.newCanvas(width + lineWidth, height + lineWidth)
	love.graphics.setCanvas(self.canvas)
	love.graphics.push()
	love.graphics.translate(lineWidth/2, lineWidth/2)
	love.graphics.polygon(self.mode, self.vertices)
	love.graphics.pop()
	love.graphics.setCanvas()
end

function Rectangle:drawPolygon()
	love.graphics.push()
	love.graphics.translate(self.x, self.y)
	love.graphics.polygon(self.mode, self.vertices)
	love.graphics.pop()
	
end

function Rectangle:draw()
	love.graphics.draw(self.canvas, self.x - self.canvasOffset, self.y - self.canvasOffset)
end

function Rectangle:sign(number)
		if number > 0 then
				return 1
		 elseif number < 0 then
				return -1
		 else
				return 0
		 end
end

function Rectangle:addAll(source)		
		for i = 1,#source do
			table.insert(self.vertices, source[i])
		end
end