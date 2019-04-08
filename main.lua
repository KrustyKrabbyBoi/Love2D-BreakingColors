--[[
    welcome to the main file!

    control key:
    (a) = k
    (b) = j
    (x) = i
    (y) = u
    dpad is arrow keys
    start = enter
    select = space
    MENU is esc
    shift is nul (not avalible for use)
    using shift allows for more options
    shift will change almost every button
]]
--vars for cool stuff

--get the files we need
local tilemap = require 'tilemap'
local game = require 'game'
--{type=0, color={}} --this is the structure of a tile object
--types include: 0=air, 1=solid tile, 2=current piece tile, etc.
tilemap.init(18, 24)

function love.load()
    love.window.setMode(320, 240, {resizable=false, highdpi=true})
    love.window.setTitle("breaking colors window")
    love.keyboard.setKeyRepeat(false)
    --tilemap.set(0, 0, {type=1, color=game.colors[love.math.random(0, #game.colors)]})
    --tilemap.set(0, 2, {type=1, color=game.colors[love.math.random(0, #game.colors)]})
    game.newPiece()

end

function love.update(dt)
    if dt < 1/30 then-------limit fps to 30 (that is all we need)------------------
        love.timer.sleep(1/30 - dt)
    end
    if love.keyboard.isDown("escape") then
        love.event.quit() --for the gameshell menu button
    end
    if game.moveTimer == 0 then
        game.moveTimer = 60
        game.movePiece(0, 1)
    else
        game.moveTimer = game.moveTimer - 1
    end
    
end

function love.draw()
    love.graphics.setBackgroundColor({255, 255, 255})
    love.graphics.setColor({0, 0, 0})
    
    tilemap.draw(20, 0, 10, 10)
end

function love.keypressed(key)
    if key == "right" then
        game.movePiece(1, 0)
    elseif key == "left" then
        game.movePiece(-1, 0)
    elseif key == "down" then
        game.movePiece(0, 1)
    end
end