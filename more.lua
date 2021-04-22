
function newAnimation (image , width , height , duration )
local animation = {}
animation .spriteSheet = image ;
animation .quads = {};
for y = 0, image :getHeight() - height , height do
for x = 0, image : getWidth() - width , width do
table.insert (animation.quads ,
love.graphics .newQuad (x , y , width , height ,
image :getDimensions ()))
end
end
animation .duration = duration or 1
animation .currentTime = 0
return animation
end


function addSprites(img, x, y, s, name)
--local xx,yy,ss = PM7.toWorld(camera,x,y)
o={
x=x,
y=y,
s=s, 
w=1,
h=0.1,
img=img, 
name=name, 
name99 =="obs"
}
		table.insert(sprites,o)
--local xx,yy,ss = PM7.toScreen(camera,o.x,o.y)
--world:add(o,xx,yy,o.w,o.h)
world:add(o,o. x,o. y,o.w,o.h)
return o
end


 
function addTree(img, x, y, s, name)
o={
x=x,
y=y,
s=s, 
w=1,
h=0.1,
img=img, 
name=name, 
name101 =="tree"
}
		table.insert(spritesTree,o)
return o
end





function addstrik(x, y)
o={
x=x,
y=y,
w=em.w,
h=40
}
		table.insert(strikT,o)
return o
end


function addstrik2(x, y)
o={
x=x,
y=y,
w=1,
h=20
}
		table.insert(strikT2,o)
return o
end

 
function drawstrik()
    for i, v in ipairs(strikT) do
        love.graphics.rectangle("line",v.x,v.y,v.w,v.h)
    end
end



function updatestrik(dt)
   for i, v in ipairs(strikT2) do
        --v.x=v.xlove.graphics.draw(img)
					v.y=v.y+player.speed*dt

				
if v.y >=playerReal.y+20 then
table.remove(strikT2, i)
end
    end

   for i, v in ipairs(strikT) do
        --v.x=v.xlove.graphics.draw(img)
					v.y=v.y+player.speed*dt
if v.y >=playerReal.y+20 then
table.remove(strikT, i)
end
    end

if player.speed > 0 then
cooldownAdd = (em.h/player.speed)/10
cooldownAdd2 = (em.h/player.speed)/10
end

		cooldown = math.max(0,cooldown - dt)
	cooldown2 = math.max(0,cooldown2 - dt)
	
	--if not (lock.checked) == true and player.cooldown <= 0 and blob.canShoot and gunlen >=0.94 and blob.live > 0 then
if not done_once then
done_once = true
		--if cooldown <= 0 then
for i=1,12 do
					--cooldown = cooldownAdd--player.speed/(player.speed/90)* 0.009
					--addstrik2(20,i* 70)
					addstrik(0,i* 70)
end
end

		if cooldown <= 0 then
					cooldown = cooldownAdd--player.speed/(player.speed/90)* 0.009
					addstrik(0,0)

		end


if cooldown2 <= 0 then
					cooldown2 = cooldownAdd2--player.speed/(player.speed/90)* 0.009
--[[
for i=1,5 do
addstrik2(Path.x+ (Path.w/3),i*8 )
addstrik2(Path.x+(Path.w/3)*2,i*8)
end]]

addstrik2(Path.x+ (Path.w/3),0 )
addstrik2(Path.x+(Path.w/3)*2,0)
		end
end

function spawnObstacles()	
local randimg=love. math.random(1,#spritesSet)
local randlane=love. math.random(1,#lanesCenters)

if not done_once_addObstacles then
done_once_addObstacles = true
for i=3,1,-1 do
addSprites(
spritesSet[randimg].img, 
lanesCenters[randlane]. x, 
i* obstacles.spawngap, 
spritesSet[randimg].size, 
spritesSet[randimg].name)

--[[
addTree(
love.graphics.newImage("tree.png"), 
lanesCenters[randlane]. x,
i* obstacles.spawngap, 14, 
'tree') ]]
--addSpr
--addSprites(spritesSet[randimg].img, lanesCenters[love. math.random(1,#lanesCenters)]. x, i* 110, spritesSet[randimg].size)
end 
end 



if #sprites >=1 then
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

if AllCharacters. Jack. unlocked and 
AllCharacters. Bat .unlocked and 
AllCharacters. Bat5 .unlocked and 
AllCharacters. Bat2 .unlocked and 
AllCharacters. Bat3 .unlocked and 
AllCharacters. Bat4 .unlocked and 
AllCharacters. Bunny .unlocked then
spawnTrees()
end

end


function spawnTrees()
local randlane=love. math.random(1,#lanesCenters)

if #spritesTree >=1 then
if spritesTree[#spritesTree].y >=love. math.random(1,5)*20+ (400) then
-- sprites[#sprites].name ~= "coin" and

--local randimg=love. math.random(1,love. math.random(#spritesSet-1,#spritesSet))


--left trees 
addTree(love.graphics.newImage("tree.png"),
love. math.random(Path.x-30,Path.x-5) , --lanesCenters[randlane]. x, 
0, 
love.math.random(10,24),"tree")

addTree(love.graphics.newImage("tree.png"),
love. math.random(Path.x-80,Path.x-40) , --lanesCenters[randlane]. x, 
0, 
love.math.random(10,24),"tree")


--right trees 
addTree(love.graphics.newImage("tree.png"),
love. math.random(Path.x+Path.w+5,Path.x+Path.w+30) , --lanesCenters[randlane]. x, 
0, 
love.math.random(10,24),"tree")

addTree(love.graphics.newImage("tree.png"),
love. math.random(Path.x+Path.w+40, Path.x+Path.w+80) , --lanesCenters[randlane]. x, 
0, 
love.math.random(10,24),"tree")

end
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



function gooi.load()
--[[
slid = gooi.newSlider({
value = 0.9 ,
x = 177 ,
y = 254 ,
w = 207 ,
h = 27,
group = "grp1"
})


buttonPalette=gooi.newButton({
text="",
w=50,
h=50,
sx=0.25,
sy=0.25
--icon="paintTool.png"
}):setIcon( "imgPalette.png" ): onRelease(function()showPaletteMenu=not showPaletteMenu end)
buttonPalette .x, buttonPalette .y=getGrid(W,H,0,15)


buttonBrush=gooi.newButton({
text="",
w=50,
h=50,
sx=0.25,
sy=0.25
--icon="paintTool.png"
}): onRelease(function()taptapTrue= not taptapTrue end)
buttonBrush .x, buttonBrush.y=getGrid(W,H,0,8)
]]

buttonCancelRetry=gooi.newButton({
text="X",
w=30,
h=30,
sx=0.25,
sy=0.25, 
group = "retry"
--icon="paintTool.png"
})

--:setIcon( "imgMenu.png" );buttonMenu.x, buttonMenu.y=getGrid(W,H,0,1)


buttonRetry=gooi.newButton({
text="continue",
w=70,
h=30,
sx=0.25,
sy=0.25,
group = "retry"
--icon="paintTool.png"
})--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)




buttonMenu=gooi.newButton({
text="MENU",
w=70,
h=50,
group = "home"
--icon="paintTool.png"
})
buttonMenu.sx=0.25
buttonMenu.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)

buttonCredit=gooi.newButton({
text="CREDIT",
w=70,
h=50,
group = "home"
--icon="paintTool.png"
})
buttonCredit.sx=0.25
buttonCredit.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)

buttonRun=gooi.newButton({
text="RUN??",
w=110,
h=100,
group = "home"
--icon="paintTool.png"
})
buttonRun.sx=0.25
buttonRun.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)





buttonPreviousItem=gooi.newButton({
text="<",
w=40,
h=25,
group = "menu"
--icon="paintTool.png"
})
buttonMenu.sx=0.25
buttonMenu.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)



buttonUseBuyItem=gooi.newButton({
text="Select/Buy",
w=120,
h=25,
group = "menu"
--icon="paintTool.png"
})
buttonMenu.sx=0.25
buttonMenu.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)


buttonNextItem=gooi.newButton({
text=">",
w=40,
h=25,
group = "menu"
--icon="paintTool.png"
})
buttonMenu.sx=0.25
buttonMenu.sy=0.25
--:setIcon( "imgNextPalette.png" )
 --buttonNextPalette.x, buttonNextPalette.y=getGrid(W,H,17,1)

end

