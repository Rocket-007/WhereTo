





function spawnObstacles()	
local randimg=love. math.random(1,#spritesSet)
local randlane=love. math.random(1,#lanesCenters)

if not done_once_addObstacles then
done_once_addObstacles = true
for i=1,3 do
addSprites(
spritesSet[love. math.random(1,#spritesSet-1)].img, 
lanesCenters[randlane]. x, 
i* obstacles.spawngap, 
spritesSet[randimg].size, 
spritesSet[randimg].name)
--addSprites(spritesSet[randimg].img, lanesCenters[love. math.random(1,#lanesCenters)]. x, i* 110, spritesSet[randimg].size)
end 
end 


if sprites[#sprites].y >=love. math.random(1,5)*20+ (obstacles.spawngap) then
-- sprites[#sprites].name ~= "coin" and

--local randimg=love. math.random(1,love. math.random(#spritesSet-1,#spritesSet))

if spritesSet[randimg].name == "coin" then
for i = 1,love. math.random(2,5) do
addSprites(
spritesSet[randimg].img, 
lanesCenters[randlane]. x, 
10*i , 
spritesSet[randimg].size, 
spritesSet[randimg].name)
end
else
addSprites(spritesSet[randimg].img, 
lanesCenters[randlane]. x, 
0, 
spritesSet[randimg].size, 
spritesSet[randimg].name)
--[[
addSprites(
spritesSet[randimg].img, 
lanesCenters[love. math.random(1,#lanesCenters)]. x, 
0, 
spritesSet[randimg].size, 
spritesSet[randimg].name)]]
end



--[[
elseif sprites[#sprites].name == "coin" then
addSprites(spritesSet[randimg].img, 
lanesCenters[randlane]. x, 
0, 
spritesSet[randimg].size, 
spritesSet[randimg].name)

addSprites(spritesSet[randimg].img, 
lanesCenters[love. math.random(1,#lanesCenters)]. x, 
0, 
spritesSet[randimg].size, 
spritesSet[randimg].name)]]
end
end





--[[
local xj,yj,s = PM7.toScreen(camera,v.x,v.y)


if yj>=player.y-4  then
local b={x=xj, y=yj, w=s*2 ,h=s*40}
Collide = checkCollision (player,b )
if Collide then
if v.name == "coin" then
coinsCollected=coinsCollected+1
end
--table.remove(sprites,i)
--Collide=true
--player.speed=0
else
--Collide=false
--player.speed=170
end
end]]



function checkCollision (a, b)
--[[
--With locals it's common usage to use underscores instead of camelCasing
local a_left = a.x
local a_right = a.x + a.w
local a_top = a.y
local a_bottom = a.y + a.h
local b_left = b.x
local b_right = b.x + b.w
local b_top = b.y
local b_bottom = b.y + b.h
--If Red's right side is further to the right than Blue's left side.
if a_right > b_left and
--and Red's left side is further to the left than Blue's right side.
    a_left < b_right and
--and Red's bottom side is further to the bottom thanBlue's top side.
    a_bottom > b_top and
--and Red's top side is further to the top than Blue's bottom side then..
    a_top < b_bottom then
--There is collision!
return true
else
--If one of these statements is false, return false.
return false
end]]


--[[
if ((b.x >= a.x + a.w) or
(b.x + b.w <= a.x) or
(b.y >= a.y + a.h) or
(b.y + b.h <= a.y)) then
return false
else return true
end]]
--[[
return a.l < b.l+b.w and
a.l+a.w > b.l and
a.t < b.t+b.h and
a.t+a.h > b.t]]

return a.x < b.x +b.w and
b.x < a.x +a.w and
a.y < b.y +b.h and
b.y < a.y +a.h
end











function getDirec(x1,y1,x2,y2)
local angle = math.atan2(y1-y2,x1-x2)
if angle >= 2.5 and angle <= math.pi or
angle <= -2.5 and angle >= -math.pi 
then return "r"

elseif angle <= 0.5 and angle >= 0 or
angle >= -0.5 and angle <= -0 
then return "l"

else return angle
end  
end












function joyKeys(dt)
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




function moreKeys()
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "home" then
        love.event.quit()
    end
end




function love.touchpressed (id, x,y)
table.insert(secondSta,{secondX,secondY})
	tapx = x
	tapy = y

	drag = true
end


function love.touchreleased(id, x, y) 
table.insert(secondRel,{secondX,secondY})
	tapRelx = x
	tapRely = y
	drag = false
tapx2 = nil
	tapy2 = nil

if Done then
--cameraPositions={x=camera:getX(), y=camera:getY()}

--end
if dashTo=="l" then
dashIndex=math.max(1,dashIndex-1)
t.camTween= tween.new(Dash,cameraPositions,{x=lanesCenters[dashIndex].x }, 'inQuad')


elseif dashTo=="r" then
dashIndex=math.min(3, dashIndex+1)
t.camTween= tween.new(Dash,cameraPositions,{x=lanesCenters[dashIndex].x }, 'inQuad')
end
end
end

function love.touchmoved (id, x, y) 
	tapx2 = x
	tapy2 = y

--calkX,calkY=tapx-tapx2,tapy-tapy2
end
end

