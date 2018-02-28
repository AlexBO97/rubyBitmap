# class BitmapEditor


#   def run(file)
#     return puts "please provide correct file" if file.nil? || !File.exists?(file)

#     File.open(file).each do |line|
#       line = line.chomp
#       case line
#       when 'S'
#           puts "There is no image"
#       else
#           puts 'unrecognised command :('
#       end
#     end
#   end
# end-------------------------------------------


def array_2D_print array
  array.each do |arr|
      arr.each do |item|
          print "#{item} "
      end
      print "\n"
  end
end

def print_image(image, lin, col)                 #         PRINTING IMAGE
  for i in 0..lin 
    for j in 0..col
      print image[i][j]
      print " "
    end
    puts ""
  end
  puts ""
  puts ""
end

def clear_image(image, lin, col)
  for i in 1..lin
    for j in 1..col
      image[i][j] = 'O'
    end
  end
end



def run 

  file='../examples/show.txt'
  lin = 0
  col = 0
  image = Array.new(251){Array.new(251)}      
  File.readlines(file).each do |line|
    if line[0] == 'I'                 #             NEW IMAGE
      values = line.split(" ")
      col = 0
      lin = 0
      values.each do |value|
        if value != "I"               #             GETTING LINES AND COLUMNS
          if col == 0
          col = value.to_i
          else
            lin = value.to_i
          end
        end
      end

      clear_image(image, lin, col)

    end
   

    if line[0] == 'C'                 #             CLEAR IMAGE
      clear_image(image, lin, col)
    end


    if line[0] == 'L'                 #             COLOR ONE PIXEL
      values = line.split(" ")
      coll = 0
      linn = 0
      colour = 'O'
      values.each do |value|
        if value != "L"               #             GETTING LINES AND COLUMNS
          if linn == 0
          linn = value.to_i
          elsif coll == 0
            coll = value.to_i
          else
            colour = value
          end
        end
      end
      image[coll][linn] = colour

    end
  
  
    if line[0] == 'V'                 # V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 
      values = line.split(" ")
      x = 0
      y1 = 0
      y2 = 0
      colour = 'O'
      values.each do |value|
        if value != "V"               #             GETTING LINES AND COLUMNS
          if x == 0
          x = value.to_i
          elsif y1 == 0
            y1 = value.to_i
          elsif y2 == 0
            y2 = value.to_i
          else
            colour = value
          end
        end
      end

  
      for i in y1..y2
        image[i][x] = colour
      end

    end
  
  
    if line[0] == 'H'                 # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2  
      values = line.split(" ")
      y = 0
      x1 = 0
      x2 = 0
      colour = 'O'
      values.each do |value|
        if value != "V"               #             GETTING LINES AND COLUMNS
          if x1 == 0
           x1 = value.to_i
          elsif x2 == 0
            x2 = value.to_i
          elsif y == 0
            y = value.to_i
          else
            colour = value
          end
        end
      end

  
      for j in x1..x2
        image[y][j] = colour
      end

    end
  
  
    if line[0] == 'S'
      print_image(image, lin, col)
    end

  
  end


end

run