require "byebug"

class Input
    attr_reader :document
    def initialize(file)
    # File.open(file, "r"){ |file| @document = file.read }
    @document = File.read(file)
    end
end

class Scrabble_Score
    attr_reader :doc_score,:snt_hgt_scre,:wrd_hgt_scre
    def initialize
        @scrabble_score = {
                            "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1,
                            "D"=>2,"G"=>2,
                            "B"=>3,"C"=>3,"M"=>3,"P"=>3,
                            "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4,
                            "K"=>5,
                            "J"=>8, "X"=>8,
                            "Q"=>10,"Z"=>10}
        @doc_score=0
        @wrd_hgt_scre={"word"=>0}
        @snt_hgt_scre={"snt"=>0}
        @doc_scre=0
        @snt_scre=0
        @wrd_scre=0
    end

    def doc_cal_scre(document)
        # byebug
        sentences=document.split(".||?")
        sentences.each do |sentence|
            @doc_scre += self.snt_cal_scre(sentence)
        end
    end

    def snt_cal_scre(sentence)
        @snt_scre=0
        words=sentence.split(".||?")
        words.each do |word|
            @snt_scre += self.wrd_cal_scre(word)
        end
        highest_score?(sentence,@snt_scre,@snt_hgt_scre)
        return @snt_scre
    end

    def wrd_cal_scre(word)
        @wrd_scre=0
        chars=word.split(".||?")
        chars.each do |char|
            char.upcase!
            if @scrabble_score.include? char
                @wrd_scre += self.scrabble_scores[char]
            else
                nil
            end
        end
        highest_score?(word,@wrd_scre,@wrd_hgt_scre)
        return @wrd_scre
    end

    def highest_score?(word_sentence,current_score,hightest_score)
        if current_score > hightest_score.values[0]
            hightest_score={word_sentence=>current_score}
        else
             nil
        end
    end
    # byebug

    def report_scores

        # byebug
        puts "Total Score of Entire 'Document' : #{@doc_score}"
        puts "Highest Score of 'Sentence' : #{@snt_hgt_scre.values[0]}"
        puts @snt_hgt_scre.keys[0]
        puts "Highest Score of 'Word' : #{@wrd_hgt_scre.values[0]}"
        puts @wrd_hgt_scre.keys[0]

        # return "hello wordl"
    end
end



# DRIVER CODE
input=Input.new("Scrabble_Document.txt")
cal_doc=Scrabble_Score.new
# puts cal_doc
cal_doc.doc_cal_scre(input.document)

p cal_doc.report_scores


# class Document(document)
    

#     score=CalculateScore.new
#     score.report_scores
# end

# class Parser
#     @parsed_document
#     @parsed_sentence
#     @parsed_word
#     def parse_doc(doc)
#     end
#     def parse_snt(sentence)
#     end
#     def parse_wrd(word)
#     end
# end