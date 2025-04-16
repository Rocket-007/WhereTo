



  

function clearAllData()
--love.filesystem.remove( "savedata.txt" )
  if true==false then
     coinsAllCollected = 0

     TotalRunDistance=0
     highestRun=0
     timePlayed=0

     selected = 1

     for i, h in ipairs(data.unlocks) do
           --h=false
           data.unlocks[i]=false
     end
     for i, h in pairs(AllCharacters) do
           h.unlocked=false
     end
AllCharacters. Bunny.unlocked =false

     AllCharacters.Jack. unlocked=true
  end
end



--media  = require "media"
home = {} -- create state
function home:init() -- ran only once
    -- notice that NOTHING is initialized in "enter" callback
    home.text = [[
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
titleFont = love.graphics.newFont("RobotoCondensed-Bold.ttf", 50)
defaultFont = love .graphics.newFont(13)

W, H = love.graphics.getWidth(),
love.graphics.getHeight()
--State.switch(home, "fade", 0.6)--love.event.quit() 
end

function home:enter() -- ran every time you enter state
media.music.themesong:setVolume( 0.5 )

gooi.setGroupVisible("home",true)
    --print("Entered tutorial state")
end

function home:update(dt)
    --home.btn:update()
end

function home:draw()
    --love.graphics.printf(home.text, 0,
--100, love.graphics.getWidth() , "center")

love.graphics.setFont(titleFont)
love.graphics.printf("WHERE TO?", 0,
100, love.graphics.getWidth() , "center")

--[[.. "".. tostring(State.current.draw )
local pp=1
for i, o in pairs (State.current) do
love.graphics.print(tostring(i).. ":".. tostring(o), 0,10*pp)
pp=pp+1
end
]]


buttonMenu.x, buttonMenu.y=(W*0.2)-(buttonMenu.w/2),(H/1.3)-(buttonMenu.h/2)
buttonCredit.x, buttonCredit.y=(W*0.8)-(buttonCredit.w/2),(H/1.3)-(buttonCredit.h/2)
buttonRun.x, buttonRun.y=W/2-(buttonRun.w/2), H/2-(buttonRun.h/2)
----ftdddjkhdfjj----
buttonMenu:onRelease(function()
saveGame()
media.sfx.click:stop()
media.sfx.click:play()
State.switch(menu, "fade", 0.6)
--gooi.setGroupVisible("home",false)
--State.switch(credit, "fade", 0.6)--love.event.quit() 

end)


buttonCredit:onRelease(function()
clearAllData()
media.sfx.click:stop()
media.sfx.click:play()
gooi.setGroupVisible("home",false)
State.switch(credit, "fade", 0.6)--love.event.quit() 

end)

buttonRun:onRelease(function()
media.sfx.click:stop()
media.sfx.click:play()

if player then
animation = newAnimation(player.img--[[love .graphics. newImage("rpg_sprite_walkfront.png" )]], player.w, player.h, 0.2)
end

--venus.effect = allFx[fxNum]slide_right
gooi.setGroupVisible("home",false)
State.switch(game, "fade", 0.6)--love.event.quit() 

end)


--buttonCancelRetry:onRelease(function()
--State.switch(home, "slide_right", 0.8)--love.event.quit() 
--end)

love.graphics.setFont(defaultFont)
gooi.draw("home")
--love.graphics.print(player.runDistance.. "/n".. highestRun, 40,280)
if newNotification then 
--highestRun=player.runDistance
love.graphics.print("NEW HIGHSCORE: "..math.floor(highestRun).. "m", W/6, H/2+(buttonRun.h/1.3)) 
--love.graphics.print(player.runDistance.. "/n".. highestRun, 40,280)
end

end

function home:leaveE()
media.sfx.click:stop()
media.sfx.click:play()
end

function home:keypressed(key)
    if key == "escape" then

--clearAllData()
saveGame()

        love.event.quit()
    end
    if key == "home" then
--clearAllData()
saveGame()
        love.event.quit()
    end
    if key == "backspace" then
--clearAllData()
saveGame()
        love.event.quit()
    end
end