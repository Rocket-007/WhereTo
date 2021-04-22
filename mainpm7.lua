--LOVE_GRAPHICS_USE_OPENGLES=1 
local PM7 = require "playmat"

function love.load()
love . window. setMode ( 0, 0 ,
{fullscreen = true}
)
	love.graphics.setDefaultFilter("nearest","nearest")
	

	img = love.graphics.newImage("map.png")
	spriteimg = love.graphics.newImage("sprite.png")
	
	--quad = love.graphics.newQuad(0,0,4,4,8,8)
	
	love.graphics.setBackgroundColor(0,0,0)
	
	sprites={{0,0}}
	screenCanvas = love.graphics.newCanvas(img:getDimensions() )

	--I get around 9 fps!
	--[[for x=4,1024,8 do
		for y=4,1024,8 do
			table.insert(sprites,{x,y})
		endlove.graphics.rectangle("fill",0,0,800,600)

	end]]
	
	camera = PM7.newCamera(800,600,img:getWidth()/2,img:getHeight(),math.rad(360-90.))


cooldown = 0
cooldownAdd =0.35-- 0.35,--0.40,

em={}
em.w,em.h=img:getDimensions()
strikT={}
end


function addstrik()
o={
x=0,
y=0,
w=em.w,
h=40
}
		table.insert(strikT,o)
return o
end

function drawstrik()
    for i, v in ipairs(strikT) do
        love.graphics.rectangle("line",v.x,v.y,v.w,v.h)
    end
end


function updatestrik(dt)
   for i, v in ipairs(strikT) do
        --v.x=v.xlove.graphics.draw(img)
v.y=v.y+290*dt
    end

cooldown = math.max(0,cooldown - dt)
--if not (lock.checked) == true and player.cooldown <= 0 and blob.canShoot and gunlen >=0.94 and blob.live > 0 then
if cooldown <= 0 then
cooldown = cooldownAdd
addstrik()
end
end


function love.draw()	

love.graphics.setCanvas(screenCanvas)
love.graphics.clear()
love.graphics.push()
love.graphics.setColor(0,0,0)
love.graphics.rectangle("fill",0,0,800,600)

love.graphics.setColor(1,1,1)

drawstrik()
love.graphics.pop()
love.graphics.setCanvas()

	PM7.drawPlane(camera,screenCanvas)

			

	--Camera point
	local x,y,s = PM7.toScreen(camera, camera:getPosition())
	love.graphics.circle("line",x,y,s/2)
	
	--To world!
	local x,y,s = PM7.toScreen(camera, PM7.toWorld(camera, love.mouse.getPosition()))
	love.graphics.circle("line",x,y,s/2)
	love.graphics.setColor(1,1,1,0.5)
		s=s*10
	love.graphics.draw(spriteimg,x,y,0,s/spriteimg:getWidth(),s/spriteimg:getHeight(),spriteimg:getWidth()/2,spriteimg:getHeight())
	love.graphics.setColor(255,255,255)

	--Sprites
	for i,v in ipairs(sprites) do
		PM7.placeSprite(camera,spriteimg,v[1],v[2],0,10)
	end
	PM7.renderSprites(camera)
	
	love.graphics.print("X: "..camera.x.."\nY: "..camera.y.."\nRot: "..camera.r.."\nFov: "..camera.f.."\nZoom: "..camera.z.."\nOffset: "..camera.o.. "\nfps: "..love.timer.getFPS())
end

function love.update(dt)
updatestrik(dt)
	if love.keyboard.isDown("q") then
		camera:setRotation(camera:getRotation()-dt)
	elseif love.keyboard.isDown("e") then
		camera:setRotation(camera:getRotation()+dt)
	end
	
	if love.keyboard.isDown("w") then
		camera.x=camera.x+math.cos(camera.r)*40*dt
		camera.y=camera.y+math.sin(camera.r)*40*dt
	elseif  love.keyboard.isDown("s") then
		camera.x=camera.x-math.cos(camera.r)*40*dt
		camera.y=camera.y-math.sin(camera.r)*40*dt
	end
	
	if love.keyboard.isDown("a") then
		camera.x=camera.x+math.cos(camera.r-math.pi/2)*40*dt
		camera.y=camera.y+math.sin(camera.r-math.pi/2)*40*dt
	elseif  love.keyboard.isDown("d") then
		camera.x=camera.x+math.cos(camera.r+math.pi/2)*40*dt
		camera.y=camera.y+math.sin(camera.r+math.pi/2)*40*dt
	end
	
	if love.keyboard.isDown("6") then
		camera:setFov(camera:getFov()+dt)
	elseif  love.keyboard.isDown("7") then
		camera:setFov(camera:getFov()-dt)
	end
	if love.keyboard.isDown("5") then
		camera:setOffset(camera:getOffset()+dt)
	elseif  love.keyboard.isDown("4") then
		camera:setOffset(camera:getOffset()-dt)
	end
	if love.keyboard.isDown("9") then
		camera:setZoom(camera:getZoom()+dt*10)
	elseif  love.keyboard.isDown("8") then
		camera:setZoom(camera:getZoom()-dt*10)
	end
	
	love.window.setTitle("FPS: "..love.timer.getFPS())
end

function love.mousepressed(x,y,m)
	if m == 1 then
		table.insert(sprites,{PM7.toWorld(camera,x,y)})
	else
		table.remove(sprites)
	end
end