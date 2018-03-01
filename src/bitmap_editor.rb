require '../image/functions'

class BitmapEditor

  def run (command)

    file='../examples/show.txt'
    lin = 0
    col = 0
    image = Array.new(251){Array.new(251)}      

    File.readlines(file).each do |line|

      token = line.split(' ')           #             SPLITTING THE STRING INTO TOKENS
      command = token[0]



      case command
      when 'I'                          #             NEW IMAGE     
        col = token[1].to_i
        lin = token[2].to_i

        if correct_command(token, command) 
          clear_image(image, lin, col)
        else
          puts "INVALID COMMAND"
          break 
        end



      when 'C'                          #             CLEAR IMAGE
        clear_image(image, lin, col)



      when 'L'                          #             COLOR ONE PIXEL
        lin_pixel = token[1].to_i
        col_pixel = token[2].to_i
        colour = token[3]
       
        if correct_command(token, command)
          image[col_pixel][lin_pixel] = colour
        else
          puts "INVALID COMMAND WHEN CREATING A NEW IMAGE"
          break
        end
        


      when 'V'                          # V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 
        x = token[1].to_i
        y1 = token[2].to_i
        y2 = token[3].to_i
        colour = token[4]
        
        if correct_command(token, command)
          for i in y1..y2
            image[i][x] = colour
          end
        else 
          puts "INVALID COMMAND FOR VERTICAL SEGMENT"
          break
        end
    


      when 'H'                          # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2  
        x1 = token[1].to_i
        x2 = token[2].to_i
        y = token[3].to_i 
        colour = token[4]

        if correct_command(token, command)
          for j in x1..x2
           image[y][j] = colour 
          end 
        else
          puts "INVALID COMMAND FOR HORIZONTAL SEGMENT"
          break
        end
         

        
      when 'S'
        print_image(image, lin, col)
      end

    end
  end
end
