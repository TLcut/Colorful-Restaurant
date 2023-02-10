function Button(word,height,width,todo,x,y)
    return{
        word = word or "Error",
        height = height,
        width = width,
        x = x,
        y = y,
        todo = todo,
        draw = function (self,word_x,word_y)
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(0,0,0)
            love.graphics.print(self.word,self.x + word_x,self.y + word_y)
            love.graphics.setColor(1,1,1)
        end,
        on_click = function (self,mouse_x,mouse_y)
            if mouse_x >= self.x and mouse_x <= self.x + self.width and mouse_y >= self.y and mouse_y <= self.y + self.height then
                self.todo()
                return true
            end
        end
    }
end

return Button