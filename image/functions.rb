
def print_image(image, lin, col)                 #          DISPLAYING IMAGE
    for i in 0..lin 
        for j in 0..col
            print image[i][j]
        end
        puts ""
    end 
end
  
def clear_image(image, lin, col)                 #          REINITIALISING IMAGE
    for i in 1..lin
        for j in 1..col
            image[i][j] = 'O'
        end
    end
end

def isalpha(ch)
    ch >= 'A' && ch <= 'Z'
end

def correct_command(token, command)             #           CHECKING IF THERE ARE NO ERRORS IN THE INPUT
    if isalpha(command)
        flag = 1
        if command == 'L' || command == 'V' || command == 'H'
            if !isalpha(token[token.length - 1])
                return false
            end
            flag = 2
        end
        for i in 1..(token.length - flag)
            if !token[i].to_i.between?(1, 250) 
                return false
            end
        end
        return true
    else
        return false
    end
end
