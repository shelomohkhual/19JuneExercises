# require "byebug"
# SCRABBLE_SCORES={
#     "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1,
#     "D"=>2,"G"=>2,
#     "B"=>3,"C"=>3,"M"=>3,"P"=>3,
#     "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4,
#     "K"=>5,
#     "J"=>8, "X"=>8,
#     "Q"=>10,"Z"=>10}

# crnt_wrd_scre={"nil"=>0}

# def word(word)
# word_score=0


# splited_word=word.split("")

# splited_word.each do |char|
    
#     if SCRABBLE_SCORES.keys.include? char.upcase!
#         word_score += SCRABBLE_SCORES[char]
#     else nil
#     end
# end
# crnt_wrd_scre={word=>word_score}

# w=word_score
# end
# word("Missipi4")
# # puts crnt_wrd_scre
# document = File.open("Scrabble_Document.txt", "r")
# document=""
# File.open("Scrabble_Document.txt", "r") do |file|
#     document=file.read
#     # puts document
# end
# puts document
# File.open("Scrabble_Document.txt", "r"){ |file| document = file.read }
class Point
    attr_accessor :x,:y
    def initialize(x,y)
      @x,@y=x,y
    end
 end
 
 class Point3D < Point
    attr_accessor :x,:y,:z
    def initialize(x,y,z)
      @x=x
      @y=y
      @z=z
    end
 end

 p p=Point.new(1,2)
 p q=Point3D.new(4,5,6)
p p.z