function Food(r,g,b)
    return{
        x = 0,
        y = 0,
        r = r,
        g = g,
        b = b,
        radius = 20,
        dice = nil,
        all_fool = {
            r = {},
            g = {},
            b = {}
        },
        cook = function (self)
            self.dice = math.random(1,9)
            for i = 1 , 9 do
                if not i == self.dice then
                    table.insert(self.all_fool.r,math.random())
                    table.insert(self.all_fool.g,math.random())
                    table.insert(self.all_fool.b,math.random())
                else
                    table.insert(self.all_fool.r,self.r)
                    table.insert(self.all_fool.g,self.g)
                    table.insert(self.all_fool.b,self.b)
                end
            end
        end,
        draw = function ()
            for i = 1 , 3 do
                for j = 1 , 3 do

                end
            end
        end,
        is_click = function ()
            
        end
    }
end

return Food