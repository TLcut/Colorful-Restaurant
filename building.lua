function Building()
    return{
        radius = 50,
        draw = function (self)
            love.graphics.setColor(0.6,0.6,0.6)
            love.graphics.rectangle("fill",0,love.graphics.getHeight()-300,400,300)
            love.graphics.rectangle("fill",0,0,love.graphics.getWidth(),140)
            love.graphics.rectangle("fill",love.graphics.getWidth()-180,0,180,love.graphics.getHeight())
            love.graphics.setColor(0.8,0.8,0.8)
            love.graphics.circle("fill",180,225,self.radius)
            love.graphics.setColor(1,1,1)
        end
    }
end

return Building