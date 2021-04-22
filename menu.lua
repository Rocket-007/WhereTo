




function disp_time(time)
  local floor=math.floor
  local days = floor(time/86400)
  local remaining = time % 86400
  local hours = floor(remaining/3600)
  remaining = remaining % 3600
  local minutes = floor(remaining/60)
  remaining = remaining % 60
  local seconds = floor(remaining) 
  if (hours < 10) then
    hours = "0" .. tostring(hours)
  end
  if (minutes < 10) then
    minutes = "0" .. tostring(minutes)
  end
  if (seconds < 10) then
    seconds = "0" .. tostring(seconds)
  end
  answer = tostring(days)..':'..hours..':'..minutes..':'..seconds
  return answer
end




menuText = [[
Unlock the bunny by beating MY highscore! 53100m ;-) 

If you unlock all the Characters there is a surprise bonus at the end, and also contact me

If you liked the game and have any suggestion, feedback, or just wanna say hi, my contacts are:
whatsapp : +234 8164 191 755
Email : obinnangwu3@gmail.com
]]



--media  = require "media"
menu = {} -- create state


function newCharacter(image , width , height )
local character = {}
character .spriteSheet = image ;
character .quads = {};
character. width, character. height= width , height
character .size = 3.5
--for y = 0, image :getHeight() - height , height do
--for x = 0, image : getWidth() - width , width do
y = 0
x = width+width
table.insert (character.quads ,
love.graphics .newQuad (x , y , width , height ,
image :getDimensions ()))
return character
end



local Character--, selected

--selected= 1


function selectItem() 
--if self.unlocked == true then
--player=self
--end
end

function buyItem(self) 
if self.unlocked == false and self.name ~= 'Bunny' then
if coinsAllCollected>self.money then
media.sfx.buy:stop()
media.sfx.buy:play()
coinsAllCollected=coinsAllCollected-self.money
self.unlocked=true
else
media.sfx.click:stop()
media.sfx.click:play()
end
else
media.sfx.click:stop()
media.sfx.click:play()
end
end



function menu:init() -- ran only once
    -- notice that NOTHING is initialized in "enter" callback
    menu.text = [[
    venus.current 
    Map:
    WASD/Mouse - Move camera
    Mouse wheel - Zoom in/out
    ESC - Menu
    Tab - Character Screen
    Battle:
    Space - Attack
    Hotkey (or click) - Skill
    ]]
    --home.btn = GenericButton(4, "Start>>", function() Gamestate.switch(game)
--end)
titleFont = love.graphics.newFont("RobotoCondensed-Bold.ttf", 20)
defaultFont = love .graphics.newFont(13)

W, H = love.graphics.getWidth(),
love.graphics.getHeight()
--State.switch(home, "fade", 0.6)--love.event.quit() 

Character= {
 newCharacter(AllCharacters.Jack.img , AllCharacters.Jack.w, AllCharacters.Jack.h), 
newCharacter(AllCharacters. Bat.img , AllCharacters. Bat.w, AllCharacters. Bat.h), 

newCharacter(AllCharacters. Bat2.img , AllCharacters. Bat2.w, AllCharacters. Bat2.h), 
newCharacter(AllCharacters. Bat3.img , AllCharacters. Bat3.w, AllCharacters. Bat3.h), 
newCharacter(AllCharacters. Bat4.img , AllCharacters. Bat4.w, AllCharacters. Bat4.h), 
newCharacter(AllCharacters. Bat5.img , AllCharacters. Bat5.w, AllCharacters. Bat5.h), 
 
newCharacter(AllCharacters. Bunny.img , AllCharacters. Bunny.w, AllCharacters. Bunny.h), 

}
end



function menu:enter() -- ran every time you enter state
gooi.setGroupVisible("home",false)
gooi.setGroupVisible("menu",true)

    --print("Entered tutorial state")
end

function menu:update(dt)
    --home.btn:update()
end

function menu:draw()
    --love.graphics.printf(home.text, 0,
--100, love.graphics.getWidth() , "center")

love.graphics.setFont(titleFont)
love.graphics.printf("WHERE TO?", 0,
40, love.graphics.getWidth() , "center")

--[[.. "".. tostring(State.current.draw )
local pp=1
for i, o in pairs (State.current) do
love.graphics.print(tostring(i).. ":".. tostring(o), 0,10*pp)
pp=pp+1
end
]]


buttonPreviousItem.x, buttonPreviousItem.y=(W/10)-(buttonPreviousItem.w/2),(H/2)-(buttonPreviousItem.h/2)
buttonUseBuyItem.x, buttonUseBuyItem.y=(W/4.38)-(buttonUseBuyItem.w/2),(H/1.7)-(buttonUseBuyItem.h/2)
buttonNextItem.x, buttonNextItem.y=W/2.7-(buttonNextItem.w/2), H/2-(buttonNextItem.h/2)



--[[
buttonMenu.x, buttonMenu.y=(W*0.2)-(buttonMenu.w/2),(H/1.3)-(buttonMenu.h/2)
buttonCredit.x, buttonCredit.y=(W*0.8)-(buttonCredit.w/2),(H/1.3)-(buttonCredit.h/2)
buttonRun.x, buttonRun.y=W/2-(buttonRun.w/2), H/2-(buttonRun.h/2)
----ftdddjkhdfjj----
]]

buttonPreviousItem:onRelease(function()
saveGame()
media.sfx.click:stop()
media.sfx.click:play()
selected =selected -1
if selected<1 then 
selected = 7
else
end
end)

buttonUseBuyItem:onRelease(function()
saveGame()

selectItem(Character[selected]) 

for i, g in pairs (AllCharacters) do
if g.number == selected then

buyItem(g) 
saveGame()

end
end
end)

buttonNextItem:onRelease(function()
saveGame()
media.sfx.click:stop()
media.sfx.click:play()
selected =selected+1
if selected>7 then 
selected = 1
else
end
end)


--buttonCancelRetry:onRelease(function()
--State.switch(home, "slide_right", 0.8)--love.event.quit() 
--end)


love.graphics.setFont(defaultFont)
gooi.draw("menu")



--love.graphics.draw(animation. spriteSheet,animation.quads [ spriteNum ],player.x, player.y, 0, player.size, player.size, player.w/2,player.w)
--animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
--love.graphics.draw(AllCharacters.Jack.img) 

love.graphics.draw(Character[selected]. spriteSheet, 
Character[selected]. quads[1],

(W/4.38),  --(Character[1].width*Character[1].size)/5,
(H/2.7), --Character[1].height*Character[1].size,

0,

Character[selected].size,
Character[selected].size, 
Character[selected].width /2, 
Character[selected].width) 

for i, g in pairs (AllCharacters) do
if g.number == selected then
--love.graphics.print(tostring(g.name) ) 
love.graphics.printf(g.name,  (W/6.98)-Character[selected].width /2,
(H/2.4), 110 , "center")

if g.unlocked == false and g.name ~= 'Bunny' then
love.graphics.printf("N".. tostring(g.money) ,  (W/4.38)-Character[selected].width /2,
(H/2.2), 50 , "center")
elseif g.name == 'Bunny' and not g.unlocked then
love.graphics.printf("----",  (W/4.38)-Character[selected].width /2,
(H/2.2), 50 , "center")
end
end 
end 

love.graphics.printf("Last Run:      "..math.floor(LastRun).. "m"  .. "\nHighest Run:"..math.floor(highestRun).. "m" .. "\nTotal Run:     "..math.floor(TotalRunDistance).. "m" .. "\n\n\nTotal Coins:  "..coinsAllCollected.. " \n\n\n\n\nTime Played:    ".."\n".. disp_time(timePlayed) ,  (W/2),
(H/4.5),W , "left")


love.graphics.printf(menuText,5, (H/1.5),W , "left")
end



function menu:keypressed(key)
    if key == "escape" then
saveGame()
media.sfx.click:stop()
media.sfx.click:play()
if player then
animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
end
        gooi.setGroupVisible("menu",false)
State.switch(home, "fade", 0.6)--love.event.quit() 

    end
    if key == "home" then
saveGame()
media.sfx.click:stop()
media.sfx.click:play()
if player then
animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
end
gooi.setGroupVisible("menu",false)
State.switch(home, "fade", 0.6)--love.event.quit() 

    end
end




