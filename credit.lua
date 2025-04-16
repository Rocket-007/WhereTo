credit = {} -- create state
function credit:init() -- ran only once
    -- notice that NOTHING is initialized in "enter" callback
    credit.text = [[
----------CREDITS----------


NGWU CHARLES OBINNA(ROCKET):

Game Systems/Mechanics Programming 

Sound Design and Music

UI Design/Programming

Production 



NGWU FELIX IKENNA(RAMPAGE): 

Graphics Artist 

Object Design 





----------. THANKS----------


To You For Playing ;-)
    ]]
    --home.btn = GenericButton(4, "Start>>", function() Gamestate.switch(game)
--end)

W, H = love.graphics.getWidth(),
love.graphics.getHeight()

end

function credit:enter() -- ran every time you enter state
--gooi.setGroupVisible("home",true)
    --print("Entered tutorial state")
end

function credit:update(dt)
    --home.btn:update()
end

function credit:draw()
    --tutorial.btn:draw()
love.graphics.setColor(0.3,0.3,0.3)
love.graphics.rectangle ("line",0+10,0+20,  W-20,  H-40)
love.graphics.setColor(0.8,0.8,0.8)
    love.graphics.printf(credit.text, 0,
80, love.graphics.getWidth() , "center")
love.graphics.setColor(1,1,1)
end

function credit:keypressed(key)
    if key == "escape" then
media.sfx.click:stop()
media.sfx.click:play()
        State.switch(home, "fade", 0.6)--love.event.quit() 
    end
    if key == "home" then
media.sfx.click:stop()
media.sfx.click:play()
        State.switch(home, "fade", 0.6)--love.event.quit() 
    end
    if key == "backspace" then
media.sfx.click:stop()
media.sfx.click:play()
        State.switch(home, "fade", 0.6)--love.event.quit() 
    end
end
