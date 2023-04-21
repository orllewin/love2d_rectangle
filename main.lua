require "Coracle/object"
require "Coracle/coracle"

local views = {}

function love.load()	
	local font = love.graphics.newFont("Fonts/SFPro/SF-Pro-Display-Regular.otf", 17)
	font:setFilter("linear", "linear", 4)
	love.graphics.setFont(font)
	
	love.graphics.setColor(coracle.colour.rgb("#ffffff"))
	love.graphics.setBackgroundColor(coracle.colour.rgb("#393649"))
	
	love.graphics.setLineWidth(1)
	
	addView(coracle.views.label("Coracle Rectangle", 10, 10))
	
	addView(coracle.graphics.rectangle('line', 10, 40, 530, 80, 8))	
	addView(coracle.views.label("Coracle", 20, 55))
	addView(coracle.views.label("coracle.graphics.rectangle('line', 10, 40, 470, 50, 8):draw()", 20, 85))
	
	addView(coracle.graphics.rectangle('line', 10, 260, 110, 30, 10))
	addView(coracle.graphics.rectangle('line', 130, 260, 110, 30, 5))
	addView(coracle.graphics.rectangle('line', 250, 260, 110, 30, 3))
	addView(coracle.graphics.rectangle('line', 370, 260, 110, 30, 2))
	
	addView(coracle.views.label("Corner: 10", 30, 264))
	addView(coracle.views.label("Corner: 5", 155, 264))
	addView(coracle.views.label("Corner: 3", 275, 264))
	addView(coracle.views.label("Corner: 2", 395, 264))
	
	addView(coracle.views.label("Various", 10, 230))
	

end	

function addView(view)
	table.insert(views, view)
end


function love.draw()	
	for i=1,#views do
		views[i]:draw()
	end

	love.graphics.print("LÖVE", 20, 145)
	love.graphics.print("love.graphics.rectangle('line', 10, 160, 470, 50, 12)", 20, 175)
	love.graphics.rectangle('line', 10, 130, 530, 80, 12)	
end