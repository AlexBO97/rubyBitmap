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


file='../examples/show.txt'
  
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
    puts lin
    puts col

#         CREATING NEW IMAGE

    image = Array.new(lin){Array.new(col)}
    for i in 0..lin-1 
      for j in 0..col-1
        image[i][j] = 'O'
      end
    end


#         PRINTING IMAGE
    for i in 0..lin-1 
      for j in 0..col-1
        print image[i][j]
        print " "
      end
      puts " "
    end
  end



  if line[0] == 'C'                 #             CLEAR IMAGE
    image = Array.new(lin){Array.new(col)}
    for i in 0..lin-1 
      for j in 0..col-1
        image[i][j] = 'O'
      end
    end
  end



  if line[0] == 'L'                 #             COLOR ONE PIXEL
    image = Array.new(lin){Array.new(col)}
    for i in 0..lin-1 
      for j in 0..col-1
        image[i][j] = 'O'
      end
    end
  end



end


