
--love . window. setMode ( 640,800 ,
--{fullscreen = false})
--love.event.quit("restart")



function upy() 
love . window. setMode ( 0,0 ,
{fullscreen = true})

 end 

require "gooi.gooi"
require "gooi.button"
--require "gooi.joy"
require "gooi.panel"
require "gooi.slider"
require "gooi.layout"
require "gooi.label"
--require "gooi.spinner"
require "gooi.component"
	require "gooi.checkbox"


media  = require "media"

local tween = require 'tween'

serialize = require 'ser'

lume = require "lume"

saveData = require("saveData")

Timer = require "timer" -- This is HUMP.timer
State = require "venus"
require "home"

function savegame()
local data = { } -- Make a table to store variables in.
--data.h=12
data.coin = coinsAllCollected 
data.whatever = "Nick"
-- Save the table to the "savegame.txt" file:
love.filesystem.write( "savegame.txt" , serialize(data))
end

function loadgame()
if not love.filesystem.exists( "savegame.txt" ) then
coinsAllCollected = 1
--coinsCollected = 0
savegame()
end
-- Load the data table:
local data = love.filesystem. load ( "savegame.txt" )()
-- Copy the variables out of the table:
Data=data
--coinsAllCollected = data.coin
--return coinsAllCollected
end




function saveGame()
data = {}
data.unlocks = {}
data.coins = coinsAllCollected--{}
--data.unlocks=AllCharacters


data.selected=selected
data.TotalRunDistance=TotalRunDistance
data.highestRun=highestRun
data.timePlayed=timePlayed


data.unlocks[1]=AllCharacters.Jack. unlocked
data.unlocks[2]=AllCharacters.Bat. unlocked
data.unlocks[3]=AllCharacters.Bat2. unlocked
data.unlocks[4]=AllCharacters.Bat3. unlocked
data.unlocks[5]=AllCharacters.Bat4. unlocked
data.unlocks[6]=AllCharacters.Bat5. unlocked
data.unlocks[7]=AllCharacters.Bunny. unlocked

for i, g in pairs (AllCharacters) do
--if g.unlocked then
--table.insert(data.unlocks, g.unlocked) 

--data.unlocks.i=g
--end
end


serialized = lume.serialize(data)
-- The filetype actually doesn't matter, and can even be omitted.
love.filesystem.write( "savedata.txt" , serialized)
end



love.graphics.setDefaultFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")

function love.load()
upy()
upy()
media.load()

require"more"
require"credit"
require"menu"

AllCharacters={

Jack={
number= 1, 
name='Eric', 
speed=200,
aboveGround=60,
size=6.2,
w=192/8, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("rpg_sprite_walkfront.png" ), 
unlocked =true,
}, 

Bat={
number= 2, 
name='Regular Bat', 
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("bat.png" ), 
money=300,
unlocked =false,

}, 



Bat2={
number= 3, 
name='Blood Bat', 
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("Blood bat.png" ), 
money=600,
unlocked =false,

}, 




Bat3={
number= 4, 
name='Kriptonite Bat', 
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("Kriptonite bat.png" ), 
money=800,
unlocked =false,

}, 


Bat4={
number= 5, 
name='Golden Bat', 
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("Golden bat.png" ), 
money=1000,
unlocked =false,

}, 

Bat5={
number= 6, 
name='Neon Bat', 
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("Neon bat.png" ), 
money=1200,
unlocked =false,

}, 




Bunny={
number= 7, 
name='Bunny', 
speed=200,
aboveGround=60,
size=4.2,
w=146/4, 
h=42,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("bunny.png" ), 
money=1300, 
unlocked =false,
}, 

}

gooi.load()
    State.registerEvents()
    --State.switch(startpage)
State.switch(home)

    allFx = {
        "slide_left",
        "slide_right",
        "slide_up",
        "slide_down",
    }
--savegame ()

coinsAllCollected = 0

TotalRunDistance=0
highestRun=0

newNotification=false

LastRun=0

timePlayed=0

selected= 1
--savegame ()
--loadgame()
coinsCollected = 0
--coinsAddCollected = 0
--savegame ()
	g={coin= coinsCollected}

if love.filesystem.getInfo( "savedata.txt" ) then
file = love.filesystem.read( "savedata.txt" )
data = lume.deserialize(file)

if data then
if data.coins then
    coinsAllCollected = data.coins 
end


if data.selected then
    selected=data. selected
end
if data.TotalRunDistance then
    TotalRunDistance=data.TotalRunDistance
end
if data.highestRun then
    highestRun=data.highestRun
end
if data.timePlayed then 
    timePlayed=data.timePlayed
end


if data.unlocks then
AllCharacters.Jack. unlocked=data.unlocks [1]
AllCharacters.Bat. unlocked=data.unlocks[2]
AllCharacters.Bat2. unlocked=data.unlocks[3]
AllCharacters.Bat3. unlocked=data.unlocks[4]
AllCharacters.Bat4. unlocked=data.unlocks[5]
AllCharacters.Bat5. unlocked=data.unlocks[6]
AllCharacters.Bunny. unlocked=data.unlocks[7]

end
end

--Apply the player info
--[[player.x = data.player.x
player.y = data.player.y
player.size = data.player.size
for i,v in ipairs(data.coins) do
coins[i] = {
x = v.x,
y = v.y,
size = 10,
image = love.graphics.newImage( "dollar.png" )
}
end]]
else
saveGame()
-- Only execute this if you don't have a save file
--data = 10
end
serialized = lume.serialize(data)
-- The filetype actually doesn't matter, and can even be omitted.
success , message =love.filesystem.write( "savedata.txt" , serialized)

player=AllCharacters.Jack 
--saveGame()
--media.sfx.buy:stop()
--media.sfx.buy:play()
media.music.themesong:play()

end




function love.draw()
--love.graphics.print(selected, 2,2) 
if player then
--love.graphics.print( player.name, 12,2) 

end
--love.graphics.print(coinsAllCollected.. "	\n"..coinsCollected , 10,10)
if data then 
local f=1
for i, g in pairs (data.unlocks) do
--love.graphics.print(tostring(g) , 10,90+(10 * f)) 
f=f+1
end
end
local pp=1
for i, o in pairs (love.filesystem.getInfo("savedata.txt")) do
--love.graphics.print(tostring(i).. ":".. tostring(o), 30,10*pp)
pp=pp+1
end
--love.graphics.printf(tostring(success) .."\n"..tostring( message ), 10,60, W, "center")

end


function lov()
if Gamestate.current() == menu then
media.music.survival:stop()
media.music.menu:play()

elseif Gamestate.current() == survival then
media.music.menu:stop()
media.music.survival:play()
end

if Gamestate.current() ~= survival then
--media.sfx.menu:play()
retry=false
end

end



function love.update(dt)
    Timer.update(dt)
media.cleanup()
timePlayed=timePlayed+dt
end


startpage= {} 
function startpage:init()
gooi.setGroupVisible("home",false)
--gooi.setGroupEnabled("home",false)

end
function startpage:update()
State.switch(home, "fade", 3)--love.event.quit() 
end

game = {} 
function game:init()
PM7 = require "playmat"
bump=require"bump.bump"

W, H = love.graphics.getWidth(),
love.graphics.getHeight()

world = bump. newWorld(40)


	--love.graphics.setDefaultFilter("nearest","nearest")
	--love.graphics.setLineStyle("rough")

	img = love.graphics.newImage("map.png")
	spriteimg = love.graphics.newImage("sprite.png")
	
	--quad = love.graphics.newQuad(0,0,4,4,8,8)
	
	love.graphics.setBackgroundColor(0,0,0)
	


	sprites={{x=0,y=0,w=0,h=0}}
spritesTree={{x=0,y=0,w=0,h=0}}


spritesSet={
{img=love.graphics.newImage("car1.png"), 
size=14, 
name='ff'
}, 

{img=love.graphics.newImage("car2.png"), 
size=10, 
name='ff'
}, 

{img=love.graphics.newImage("construction.png"), 
size=10, 
name='ff'
}, 

{img=love.graphics.newImage("cone.png"), 
size=10, 
name='ff'
}, 


{img=love.graphics.newImage("2.png"), 
size=5, 
name='coin'
}, 

}

	screenCanvas = love.graphics.newCanvas(img:getDimensions() )
	screenCanvasRetry = love.graphics.newCanvas(W/1.7,H/3)
	
	camera = PM7.newCamera(W, H ,img:getWidth()/2,img:getHeight(),math.rad(360-90.), 11)
cooldown = 0
cooldownAdd = 0.50-- 0.35,--0.40,

cooldown2 = 0
cooldownAdd2 = 0.30-- 0.35,--0.40,


em={}
em.w,em.h=img:getDimensions()

Dash=0.26
dashTo=0
dashIndex=2

--whole road
Path={
y=0, 
w=30,
}
Path.x=em.w/2-(Path.w/2)

lanesCenters={
{x=Path.x+((Path.w/3)/2)}, 
{x=Path.x+((Path.w/3)/2)+(30/3)}, 
{x=Path.x+((Path.w/3)/2)+(30/3)* 2}
}

secondSta={}
secondRel={}
--tapx, tapy, tapx2, tapy2=0,0,0,0
tapx, tapy, tapx2, tapy2=nil, nil,nil, nil
--running lines off road
strikT={}
strikT2={}

cameraPositions={x=camera:getX(), y=camera:getY()}



--[[
AllCharacters={

Jack={
speed=200,
aboveGround=60,
size=6.2,
w=192/8, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("rpg_sprite_walkfront.png" )
}, 

Bat={
speed=200,
aboveGround=100,
size=6.2,
w=128/4, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("bat.png" ), 
money=1300,

}, 

Bunny={
speed=200,
aboveGround=60,
size=4.2,
w=146/4, 
h=42,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("bunny.png" ), 
money=1300, 
}, 

}]]


--player=AllCharacters.Bat--Jack 

for i, g in pairs (AllCharacters) do
if g.number == selected then
love.graphics.print("gjffyhjj nhffj. J ujhdr".. tostring(selected), 10,10 ) 
--love.graphics.printf(g.name,  (W/4.38)-Character[selected].width /2,
--(H/2.4), 50 , "center")
--player =g
end
end

--[[
speed=200,
aboveGround=60,
size=6.2,
w=192/8, 
h=33,
runDistance=0,
isDead=false]]




	--local x,y,s = PM7.toScreen(camera, camera:getPosition())
	--local x,y = PM7.toScreen(camera, Path.x, em.h)
--love.graphics.circle("line",x,y,s)
	
holdPlayer={}


playerReal={
w=1,--192/8, 
h=1,
}
local x,y = camera:getPosition()

playerReal. x= x
playerReal.y=y-1
--playerReal. x=playerReal. x
world:add(player,playerReal. x,playerReal. y,playerReal.w,playerReal.h)

obstacles={
spawngap=190
}


scoreFont = love.graphics.newFont(12)

animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
--animation = newAnimation(love .graphics. newImage("rpg_sprite_walkfront.png" ), player.w, player.h, 0.2)

coinsCollected=0
 
sok={s=0}

t={}
Tcoin={}
t.camTween = tween.new(0.11,{g=1},{g=3})
--t.pathTween = tween.new(3,Path,{w=15})

done_once_addstrik = false
done_once_addObstacles= false

gooi.setGroupVisible("retry",false)

end
--love.load()

function game:leave()
media.music.themesong:setVolume( 0.5 )

tapx, tapy, tapx2, tapy2=nil, nil,nil, nil

t={}
Tcoin={}
--t.camTween = tween.new(0.11,{g=1},{g=3})
t.camTween= tween.new(0.1111,cameraPositions,{x=lanesCenters[2].x }, 'inQuad')

world = bump. newWorld(40)


	sprites={{x=0,y=0,w=0,h=0}}
spritesTree={{x=0,y=0,w=0,h=0}}



lanesCenters={
{x=Path.x+((Path.w/3)/2)}, 
{x=Path.x+((Path.w/3)/2)+(30/3)}, 
{x=Path.x+((Path.w/3)/2)+(30/3)* 2}
}

--running lines off road
strikT={}
strikT2={}

--cameraPositions={x=lanesCenters[2], y=camera:getY()}
--cameraPositions={x=camera:getX(), y=camera:getY()}

--player=AllCharacters.Jack

--[[
player={
speed=200,
--x=lanesCenters[2], 
aboveGround=60,
size=6.2,
w=192/8, 
h=33,
runDistance=0,
isDead=false, 
img=love .graphics. newImage("rpg_sprite_walkfront.png" )
}]]


player. speed=200
player. isDead=false
player. runDistance=0



playerReal={
w=1,--192/8, 
h=1,
}
local x,y = camera:getPosition()

playerReal. x= x
playerReal.y=y-1
--playerReal. x=playerReal. x
--world:add(player,playerReal. x,playerReal. y,playerReal.w,playerReal.h)

obstacles={
spawngap=190
}


--scoreFont = love.graphics.newFont(9)

--animation = newAnimation(AllCharacters.Bat.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)

--animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
--animation = newAnimation(love .graphics. newImage("rpg_sprite_walkfront.png" ), player.w, player.h, 0.2)

--coinsCollected=0
 
sok={s=0}


--t.pathTween = tween.new(3,Path,{w=15})

done_once_addstrik = false
done_once_addObstacles= false

gooi.setGroupVisible("retry",false)
end

function game:enter()
media.music.themesong:setVolume( 0.3 )


newNotification=false
world = bump. newWorld(40)

--[[
playerr={
speed=200,
--x=lanesCenters[2], 
aboveGround=60,
size=6.2,
w=192/8, 
h=33,
runDistance=0, 
isDead=false
}]]
for i, g in pairs (AllCharacters) do
if g.number == selected and g.unlocked == true then
love.graphics.print("gjffyhjj nhffj. J ujhdr".. tostring(selected), 10,10 ) 
--love.graphics.printf(g.name,  (W/4.38)-Character[selected].width /2,
--(H/2.4), 50 , "center")I
player =g
--player.img =g.img
end
end
 if world:hasItem(player) then
world:remove(player) 
world:add(player,playerReal. x,playerReal. y,playerReal.w,playerReal.h)
else
world:add(player,playerReal. x,playerReal. y,playerReal.w,playerReal.h)

end
animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)


coinsCollected=0

gooi.setGroupVisible("retry",false)
tapx, tapy, tapx2, tapy2=nil, nil,nil, nil

end

function game:update (dt)
--return end 
gooi.update(dt)
updatestrik(dt)
spawnObstacles(dt)	

for i,v in pairs(t) do
v:update(dt)
if tostring(i) == "camTween" then
Done = v:update(dt)
end
end

for i,v in pairs(Tcoin) do
v:update(dt)
--Tcoin.camTween
end

if sok.t then
sok.t:update(dt)
end

player. runDistance= player. runDistance+player.speed* dt
player.x, player.y=W/2,H-(player.aboveGround )

if player.isDead==false then
player.speed= player.speed+5* dt
elseif player.isDead==true then
player.speed= 0
end



camera:setPosition(cameraPositions.x, camera:getY())--, cameraPositions. y)
--playerReal. x=camera:getX()

animation .currentTime = animation .currentTime + dt
if animation .currentTime >= animation .duration then
animation .currentTime = animation .currentTime -
animation.duration
end

Playerfilter=function(item, other)
  if other. name =='coin' then
    return "cross"
--elseif other. name99 =="obs" then
    --return "cross"
else return "cross"
end

end 

  				--local future_l = self.x + self.vx * dt
  				--local future_t = self.y + self.vy * dt


  				local next_l, next_t, cols, len = world:move(player, camera:getX() , playerReal.y, Playerfilter)

  playerReal.x, playerReal.y = next_l, next_t

         for z=1,len do
         local coll=cols[z]
--[[
                     media.sfx.clank1:stop()
                     media.sfx.clank1:play()
]]
--[[
if z then
player. speed=0

else
player. speed=270
end ]]


if coll.other.name=="coin" then
--coinsCollected=coinsCollected+1
--Collide=true
--coll.item.y=0
end 

end

Obstaclefilter=function(item, other)
  if other.speed and item. name =='coin' then
    return "cross"
elseif other. name99 =="obs" then
    return nil--"cross"
elseif other.speed and item. name ~='coin' then
  return "slide"
 --return "slide"
else return "cross"
end

end 
  



for i, v in pairs(spritesTree) do
v.y=v.y+player.speed*dt

if v.y >=playerReal.y+20 then	 
             table.remove(spritesTree, i)
        end
end




   for i, v in pairs(sprites) do
   
   if world:hasItem(v) then						
        if v.y >=playerReal.y+20 then
             world:remove(v)	 
             table.remove(sprites, i)
        end
   elseif world:hasItem(v)==false then	
        if v.y >=playerReal.y+20 then
             --table.remove(sprites, i)
        end
   end
        --v.x=v.xlove.graphics.draw(img)
--v.y=v.y+player.speed*dt
--love .graphics.rectangle('fill', player.x,player.y, player.w, player.h  ) 
  	   if world:hasItem(v) then
local xj,yj,s = PM7.toScreen(camera,v.x,v.y)
local future_l = v.x-- + self.vx * dt
  				local future_t = v.y	 + player.speed * dt		
  				local next_l, next_t, cols, len = world:move(v, future_l, future_t, Obstaclefilter)
--local next_l, next_t, cols, len = world:move(v, xj,yj)
  v.x, v.y = next_l, next_t
         for z=1,len do
           local coll=cols[z]
--[[
                     media.sfx.clank1:stop()
                     media.sfx.clank1:play()
]]
if coll.other.speed and coll.item.name ~="coin" then
sok.t=tween.new(0.16,sok,{s=1}, inOutBack)
table.insert(holdPlayer,player.speed)
player.isDead=true
Collide=true
media.sfx.hit:stop()
media.sfx.hit:play()
end 

if coll.other.speed then
Collide=true
end 
if coll.other.speed and coll.item.name=="coin" then
--Tcoin.camTween = tween.new(0.91,coll.item,{x=3})
coinsCollected=coinsCollected+1
media.sfx.coin:stop()
media.sfx.coin:play()
world:remove(v)	 
  table.remove(sprites, i)
end
end  
end

buttonRetry:onRelease(function()--sok.s=0
media.sfx.buy:stop()
media.sfx.buy:play()
--[[
coinsAllCollected=coinsAllCollected+coinsCollected
savegame()



player.isDead=false
player.speed=200
sok.t=tween.new(0.16,sok,{s=0}, inOutBack)
 
for i=#sprites-1,1,-1 do
table.remove(sprites, i)
end]]
end)

if player.isDead then
--player. speed=0
end

if sok.s >=0.9 then
		if sok.s >0 then
				--player. speed=0
		end
gooi.setGroupVisible("retry",true)
--player. speed=0
elseif sok.s < 0.9 then
gooi.setGroupVisible("retry",false)
--player.speed=50--holdPlayer[#holdPlayer]
--gooi.setGroupEnabled("grp1",not showPaletteMenu)
end

end
joyKeys(dt)
end


function game:draw()	
love.graphics.setCanvas(screenCanvas)
love.graphics.clear()
love.graphics.push()
--love.graphics.scale(1.2)
--love.graphics.setColor(0,0,0)
--love.graphics.rectangle("fill",0,0,800,600)
love.graphics.setColor(0.2,0.2,0.2)
love.graphics .setLineWidth( 15 )
drawstrik()
love.graphics .setLineWidth( 1 )
love.graphics.setColor(0,0,0)

--whole road
--love.graphics .setLineWidth( 0.7 )
love.graphics.rectangle("fill",Path.x,0,Path.w,em.h)
love.graphics.setColor(0.3,0.3,0.3)
--lanes
--love.graphics .setLineWidth( 1 )
love.graphics.line(Path.x,0,Path.x, em.h)
love.graphics.setColor(0.2,0.2,0.2)

--love.graphics .setLineWidth( 0.7 )
love.graphics.line(Path.x+ (Path.w/3),0,Path.x+ (Path.w/3),em.h)
love.graphics.line(Path.x+(Path.w/3)*2,0,Path.x+(Path.w/3)*2, em.h)

love.graphics .setLineWidth( 1 )
love.graphics.setColor(0.3,0.3,0.3)
love.graphics.line((Path.x+Path.w),0,(Path.x+Path.w), em.h)

love.graphics.setColor(0,0,0)
    for i, v in ipairs(strikT2) do
        love.graphics.rectangle("line",v.x,v.y,v.w,v.h)
    end
love.graphics.setColor(1,1,1)
love.graphics.pop()
love.graphics.setCanvas()

	PM7.drawPlane(camera,screenCanvas)

	--Camera point
	local x,y,s = PM7.toScreen(camera, camera:getPosition())
	love.graphics.circle("line",x,y,s/2)
	
	--To world!
--[[
	local x,y,s = PM7.toScreen(camera, PM7.toWorld(camera, love.mouse.getPosition()))
	love.graphics.circle("line",x,y,s/2)
	love.graphics.setColor(1,1,1,0.5)
		s=s*10
	love.graphics.draw(spriteimg,x,y,0,s/spriteimg:getWidth(),s/spriteimg:getHeight(),spriteimg:getWidth()/2,spriteimg:getHeight())]]
	love.graphics.setColor(255,255,255)

--local x,y,s = PM7.toScreen(camera,player.x,player.y)
--love .graphics.rectangle('fill',x,y,  player.w, player.h  ) 

	--Sprites
	for i,v in pairs(sprites) do
local x,y,s = PM7.toScreen(camera,v.x,v.y)
love .graphics.rectangle('line', x,y,v.w ,v.h) 
--love .graphics.rectangle('line', v.x,v.y,v.w ,v.h) 
	if v.img then
		PM7.placeSprite(camera,v.img,v.x,v.y,0,v.s)
	end
	end

for i,v in pairs(spritesTree) do
local x,y,s = PM7.toScreen(camera,v.x,v.y)
love .graphics.rectangle('line', x,y,v.w ,v.h) 
--love .graphics.rectangle('line', v.x,v.y,v.w ,v.h) 
	--if v.img then
		PM7.placeSprite(camera,love.graphics.newImage("tree.png"),v.x,v.y,0,v.s)
	--end
	end


	PM7.renderSprites(camera)
	
local spriteNum = math.floor (animation.currentTime /
animation.duration * # animation. quads ) + 1

if animation.quads [ spriteNum ] and not player.isDead then
love.graphics.draw(animation. spriteSheet,animation.quads [ spriteNum ],player.x, player.y, 0, player.size, player.size, player.w/2,player.w)
end

--love .graphics.rectangle('fill',player.x,player.y,  player.w, player.h  ) 

local x,y,s = PM7.toScreen(camera, playerReal.x,playerReal.y)
love .graphics.rectangle('fill', x,y,   playerReal.w* 2, playerReal.h* 2  ) 

love.graphics.print(--[["X: "..camera.x.."\nY: "..camera.y.."\nRot: "..camera.r.."\nFov: "..camera.f.."\nZoom: "..camera.z.."\nOffset: "..camera.o.. ]]"\nfps: "..love.timer.getFPS())
--love.graphics.print(cameraPositions. x.. " \n   ".. cameraPositions.y, 80,10)

love.graphics.setFont(scoreFont)
for i,v in pairs(t) do
local vip=t[i]
--v:update(dt)
--love.graphics.print("heree.    ".. tostring(i)..'    '..tostring(Done)  , 100,10)
end

if drag and tapx2 then
love.graphics.line(tapx, tapy, tapx2, tapy2)
dashTo=getDirec(tapx, tapy, tapx2, tapy2)
end
--love.graphics.print('ya angle  '.. dashTo..'\nplayer. runDistance: '.. player. runDistance.. "\nCollide.  :"..tostring(Collide) .. "\ncoinsCollected".. coinsCollected.."\nsprites ".. #sprites, 80,60)

local io=1
for i, o in pairs (player) do
--love.graphics.print(tostring(i)..": "..  tostring(o),170, 80+(io* 10))3
io=io+1
end
--love.graphics.print("strikT:" .. tostring(#strikT).." \n".."strikT2:" ..  tostring(#strikT2).. " \n".."sprite:" ..  tostring(#sprites).. "\ncooldown".. tostring(cooldown),170, 190)


love.graphics.print("Distance: "..math.floor(player.runDistance) ..  "\nSpeed: "..math.floor(player.speed) ..  "\n\n Coins: "..coinsCollected ,W/1.6, (10))

    love .graphics .setColor(1, 1, 1, 1)
screenCanvasRetryDraw()
    --love .graphics .setBlendMode( "alpha" , "premultiplied" )

if sok.s >0 then
love.graphics.draw(screenCanvasRetry,W/2,H/2, 
0,sok.s,nil, 
(screenCanvasRetry:getWidth()/2),
(screenCanvasRetry:getHeight()/2))
end
end



function screenCanvasRetryDraw()
love.graphics.setCanvas(screenCanvasRetry)
love.graphics.clear()
love.graphics.push()
--love.graphics.scale(s.s)
love.graphics.setColor(1,1,1, 0.3)
love.graphics.rectangle("fill",0,0,screenCanvasRetry:getWidth(),screenCanvasRetry:getHeight())
love.graphics.setColor(1,1,1)
love.graphics.rectangle("line",0,35,screenCanvasRetry:getWidth(),screenCanvasRetry:getHeight()-35)
love.graphics.rectangle("line",screenCanvasRetry:getWidth()-30,0,30,30)

buttonCancelRetry.x, buttonCancelRetry.y=(W/2)+(screenCanvasRetry:getWidth()/2)-30,(H/2)-(screenCanvasRetry:getHeight()/2)-0
buttonRetry.x, buttonRetry.y=(W/2)-(buttonRetry.w/2),(H/2)+(screenCanvasRetry:getHeight()/2)-buttonRetry.h-10

----ftdddjkhdfjj----


buttonCancelRetry:onRelease(function()

if player.runDistance>highestRun then 
newNotification =true 
highestRun=player.runDistance 
end

if player.runDistance>53100 then 
AllCharacters. Bunny.unlocked =true
end


LastRun=player.runDistance
coinsAllCollected=coinsAllCollected+coinsCollected--+10000
TotalRunDistance=TotalRunDistance+player.runDistance
savegame()

--venus.effect = allFx[fxNum]slide_right
media.sfx.click:stop()
media.sfx.click:play()
State.switch(home, "fade", 0.6)--love.event.quit() 
end)



love.graphics.printf("Use 1 Special Item \n to continue, \n \n You have 0 \n Special Items left! ",0-(screenCanvasRetry:getWidth()/2.8),50, W, "center")
love.graphics.pop()

love.graphics.setCanvas()
gooi.draw("retry")

gooi.draw()
--gooi.draw("grp1")
--gooi.setGroupVisible("grp1",not showPaletteMenu)
--gooi.setGroupEnabled("grp1",not showPaletteMenu)
end





function game:mousepressed(x,y,m)
--t.camTween= tween.new(0.3,cameraPositions,{x=cameraPositions. x+5}, 'inQuad')
local ax, ay=PM7.toWorld(camera,x,y)
local rand=love. math.random(1,#spritesSet)
	if m == 1 then
		--table.insert(sprites,{addSprites(nil, ax, ay, nil)})
--addSprites(spritesSet[rand].img, ax, ay, spritesSet[rand].size)
	else
		--table.remove(sprites)
	end
end




function game:touchpressed (id, x,y)
--gooi.pressed(id, x, y)
table.insert(secondSta,{secondX,secondY})
	tapx = x
	tapy = y
	drag = true
end


function game:touchreleased(id, x, y) 
--gooi.released(id, x, y) 
table.insert(secondRel,{secondX,secondY})
	tapRelx = x
	tapRely = y
	drag = false
tapx2 = nil
	tapy2 = nil

if Done and not player.isDead then
--cameraPositions={x=camera:getX(), y=camera:getY()}

--end
if dashTo=="l" then
dashIndex=math.max(1,dashIndex-1)
t.camTween= tween.new(Dash,cameraPositions,{x=lanesCenters[dashIndex].x }, 'inQuad')
media.sfx.swipe1:stop()
media.sfx.swipe1:play()

elseif dashTo=="r" then
dashIndex=math.min(3, dashIndex+1)
t.camTween= tween.new(Dash,cameraPositions,{x=lanesCenters[dashIndex].x }, 'inQuad')
media.sfx.swipe1:stop()
media.sfx.swipe1:play()
end
end
end


function game:touchmoved (id, x, y) 
--gooi.moved(id, x, y) 
	tapx2 = x
	tapy2 = y
--calkX,calkY=tapx-tapx2,tapy-tapy2
end


function love.touchpressed (id, x,y)
gooi.pressed(id, x, y)
end
function love.touchreleased(id, x, y) 
gooi.released(id, x, y) 
end
function love.touchmoved (id, x, y) 
gooi.moved(id, x, y) 
end

