_G.love = require "love"
local customer = require "customer"
local button = require "button"
local bulilding = require "building"
local food = require "food"

math.randomseed(os.time())

local customers = {
    r = {},
    g = {},
    b = {},
    people = {}
}

local function create_a_customer()
    table.insert(customers["r"],math.random())
    table.insert(customers["g"],math.random())
    table.insert(customers["b"],math.random())
    table.insert(customers["people"],customer(customers["r"][#customers["people"]+1],customers["g"][#customers["people"]+1],customers["b"][#customers["people"]+1]))
end

local game = {
    state = {
        menu = true,
        running = false
    }
}

local buttons = {}

local function start()
    game.state["menu"] =false
    game.state["running"] = true
    buttons = {}
    create_a_customer()
end

local function menu()
    buttons = {
        button("Start",20,100,start,love.graphics.getWidth()/2 - 50,love.graphics.getHeight()/2 - 40),
        button("Exit",20,100,love.window.close,love.graphics.getWidth()/2 - 50,love.graphics.getHeight()/2)
    }
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        for i = 1,#buttons do
            if buttons[i]:on_click(x,y) then
                break
            end
        end
    end
end

function love.load()
    love.graphics.setBackgroundColor(0,0,0)
    love.window.setTitle("顏色餐廳")
    menu()
end

function love.update(dt)
    for i = 1 , #customers do
        customers[i]:keep_in_line(#customers)
    end
end

function love.draw()
    bulilding():draw()
    love.graphics.setColor(1,1,1)
    love.graphics.printf(
        "FPS: ".. love.timer.getFPS() ,
        love.graphics.newFont(16) ,
        10 ,
        love.graphics.getHeight() -30 ,
        love.graphics.getWidth()
    )
    for i = 1 , #buttons do
        buttons[i]:draw(0,5)
    end
    if not game.state["menu"] then
        if game.state["running"] then
            for i = 1 , #customers do
                customers[i]:draw()
            end
        end
    else
        love.graphics.printf(
            "Colorful Restaurant" ,
            love.graphics.newFont(20) ,
            love.graphics.getWidth()/2 - 90 ,
            200,
            love.graphics.getWidth()
        )
    end
end