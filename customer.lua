function Customer(r,g,b)
    return{
        radius = 20,
        x = 0,
        y = 0,
        r = r,
        g = g,
        b = b,
        keep_in_line = function (self,amount)
            self.x = self.x + (love.graphics.getWidth() - self.radius - 200 - self.x) / 5
            self.y = self.y + (love.graphics.getHeight() - self.radius * (7) + self.radius * (amount) - self.y) / 5
        end,
        draw = function (self)
            love.graphics.setColor(self.r,self.g,self.b)
            love.graphics.circle("fill",self.x,self.y,self.radius)
            love.graphics.setColor(1,1,1)
        end
    }
end

return Customer