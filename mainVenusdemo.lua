Timer = require "timer"
venus = require "venus"

states = {}

states.one = {}

function centerDraw(img)
    love.graphics.draw(img, love.graphics.getWidth()/2 - img:getWidth()/2, love.graphics.getHeight()/2 - img:getHeight()/2 - 50)
end

function states.one:init()
    states.one.img = love.graphics.newImage("venus1.jpg")
end

function states.one:mousereleased(x, y, key)
    if key == 1 then
        venus.switch(states.two)
    end
end

function states.one:draw()
    centerDraw(states.one.img)
end

states.two = {}

function states.two:init()
    states.two.img = love.graphics.newImage("venus2.jpg") 
end

function states.two:mousereleased(x, y, key)
    if key == 1 then
        venus.switch(states.three)
    end
end

function states.two:draw()
    centerDraw(states.two.img)
end

states.three = {}

function states.three:init()
    states.three.img = love.graphics.newImage("venus3.jpg")
end

function states.three:mousereleased(x, y, key)
    if key == 1 then
        venus.switch(states.one)
    end
end

function states.three:draw()
    centerDraw(states.three.img)
end


function love.load()
    love.window.setTitle("Venus Demo")
    
    venus.registerEvents()
    venus.switch(states.one)

    allFx = {
        "slide_left",
        "slide_right",
        "slide_up",
        "slide_down",
    }
    
    fxNum = 17
    stateNum = 1
end

function love.update(dt)
    Timer.update(dt)
end

function love.keyreleased(key)
    if key == "n" then
        if fxNum < #allFx then
            fxNum = fxNum + 1
        else
            fxNum = 1
        end
        
        venus.effect = allFx[fxNum]
    end
end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 240)
    love.graphics.setColor(30, 30, 30)
    love.graphics.rectangle("line", 5, love.graphics.getHeight() - 120, love.graphics.getWidth()-10, 115)
    love.graphics.printf("Space - Next state | N - Change animation", 0, love.graphics.getHeight() - 80, love.graphics.getWidth(), "center")
    love.graphics.printf("Current animation is: "..venus.effect, 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), "center")
    love.graphics.setColor(255, 255, 255)
end
