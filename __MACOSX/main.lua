
--love . window. setMode ( 640,800 ,
--{fullscreen = false})
--love.event.quit("restart")

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


local tween = require 'tween'

function love.load()

upy()
upy()




PM7 = require "playmat"
bump=require"bump.bump"
require"more"

W, H = love.graphics.getWidth(),
love.graphics.getHeight()

world = bump. newWorld(40)


	love.graphics.setDefaultFilter("nearest","nearest")
	love.graphics.setLineStyle("rough")

	img = love.graphics.newImage("map.png")
	spriteimg = love.graphics.newImage("sprite.png")
	
	--quad = love.graphics.newQuad(0,0,4,4,8,8)
	
	love.graphics.setBackgroundColor(0,0,0)
	


	sprites={{x=0,y=0,w=0,h=0}}

spritesSet={
{img=love.graphics.newImage("spriteT.png"), 
size=14, 
name='ff'
}, 

{img=love.graphics.newImage("spritee.png"), 
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
	
	camera = PM7.newCamera(W, H ,img:getWidth()/2,img:getHeight(),math.rad(360-90.), 15)
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
tapx, tapy, tapx2, tapy2=0,0,0,0

--running lines off road
strikT={}
strikT2={}

cameraPositions={x=camera:getX(), y=camera:getY()}


player={
speed=100,
aboveGround=60,
size=5,
w=192/8, 
h=33,
runDistance=0
}
	--local x,y,s = PM7.toScreen(camera, camera:getPosition())
	--local x,y = PM7.toScreen(camera, Path.x, em.h)
--love.graphics.circle("line",x,y,s)
	

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


scoreFont = love.graphics.newFont(9)


animation = newAnimation(love .graphics. newImage("rpg_sprite_walkfront.png" ), player.w, player.h, 0.2)

coinsCollected=0
 
sok={s=0}

t={}
Tcoin={}
t.camTween = tween.new(0.11,{g=1},{g=3})
--t.pathTween = tween.new(3,Path,{w=15})

done_once_addstrik = false
done_once_addObstacles= false

gooi.load()
end
--love.load()







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
    end

   for i, v in ipairs(strikT) do
        --v.x=v.xlove.graphics.draw(img)
					v.y=v.y+player.speed*dt
    end

cooldownAdd = (em.h/player.speed)/10
cooldownAdd2 = (em.h/player.speed)/10

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




function updatestrik2(dt)

		--cooldown = math.max(0,cooldown - dt)
		--if not (lock.checked) == true and player.cooldown <= 0 and blob.canShoot and gunlen >=0.94 and blob.live > 0 then
if not done_once then
--done_once = true
for i=1,12 do
					--addstrik2(20,i* 70)
end
end

		if cooldown <= 0 then
					--cooldown = cooldownAdd--player.speed/(player.speed/90)* 0.009
					addstrik2(0,0)
		end
end





function love.update(dt)
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
player.speed= player.speed+5* dt

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
elseif other. name99 =="obs" then
    return "cross"

--else return "cross"
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
    return "cross"
elseif other.speed then
  --return "cross"
 return "cross"--"slide"
else return "cross"
end

end 


   for i, v in pairs(sprites) do
   
   if world:hasItem(v) then						
if v.y >=playerReal.y+20 then
world:remove(v)	 
  table.remove(sprites, i)
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
Collide=true
--love.event.quit()
end 

if coll.other.speed then
Collide=true
else
end 
if coll.other.speed and coll.item.name=="coin" then
--Tcoin.camTween = tween.new(0.91,coll.item,{x=3})
coinsCollected=coinsCollected+1
world:remove(v)	 
  table.remove(sprites, i)
end
end  
end

end
joyKeys(dt)
end


function love.draw()	
love.graphics.setCanvas(screenCanvas)
love.graphics.clear()
love.graphics.push()
--love.graphics.scale(1.2)
--love.graphics.setColor(0,0,0)
--love.graphics.rectangle("fill",0,0,800,600)
love.graphics.setColor(1,1,1,0.6)
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
	PM7.renderSprites(camera)
	
local spriteNum = math.floor (animation.currentTime /
animation.duration * # animation. quads ) + 1

if animation.quads [ spriteNum ] then
love.graphics.draw(animation. spriteSheet,animation.quads [ spriteNum ],player.x, player.y, 0, player.size, player.size, player.w/2,player.w)
end

--love .graphics.rectangle('fill',player.x,player.y,  player.w, player.h  ) 

local x,y,s = PM7.toScreen(camera, playerReal.x,playerReal.y)
love .graphics.rectangle('fill', x,y,   playerReal.w* 2, playerReal.h* 2  ) 

love.graphics.print("X: "..camera.x.."\nY: "..camera.y.."\nRot: "..camera.r.."\nFov: "..camera.f.."\nZoom: "..camera.z.."\nOffset: "..camera.o.. "\nfps: "..love.timer.getFPS())
love.graphics.print(cameraPositions. x.. " \n   ".. cameraPositions.y, 80,10)

love.graphics.setFont(scoreFont)
for i,v in pairs(t) do
local vip=t[i]
--v:update(dt)
love.graphics.print("heree.    ".. tostring(i)..'    '..tostring(Done)  , 100,10)
end

if drag and tapx2 then
love.graphics.line(tapx, tapy, tapx2, tapy2)
dashTo=getDirec(tapx, tapy, tapx2, tapy2)
end
love.graphics.print('ya angle  '.. dashTo..'\nplayer. runDistance: '.. player. runDistance.. "\nCollide.  :"..tostring(Collide) .. "\ncoinsCollected".. coinsCollected.."\nsprites ".. #sprites, 80,60)

    love .graphics .setColor(1, 1, 1, 1)
screenCanvasRetryDraw()
    --love .graphics .setBlendMode( "alpha" , "premultiplied" )
 
sok.t=tween.new(0.16,sok,{s=1}, inOutBack)

love.graphics.draw(screenCanvasRetry,W/2,H/2, 
0,sok.s,nil, 
(screenCanvasRetry:getWidth()/2),
(screenCanvasRetry:getHeight()/2))
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


love.graphics.pop()
love.graphics.setCanvas()


gooi.draw()
--gooi.draw("grp1")
--gooi.setGroupVisible("grp1",not showPaletteMenu)
--gooi.setGroupEnabled("grp1",not showPaletteMenu)
end





function love.mousepressed(x,y,m)
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


function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "home" then
        love.event.quit()
    end
end


function love.touchpressed (id, x,y)
gooi.pressed(id, x, y)
table.insert(secondSta,{secondX,secondY})
	tapx = x
	tapy = y
	drag = true
end


function love.touchreleased(id, x, y) 
gooi.released(id, x, y) 
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
gooi.moved(id, x, y) 
	tapx2 = x
	tapy2 = y
--calkX,calkY=tapx-tapx2,tapy-tapy2
end


