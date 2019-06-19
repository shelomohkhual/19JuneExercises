
class Input
    def initialize(file)
    @processor= Processor.new(self.file)
    end
end

class Processor
    attr_reader :document,:scrabble_scores
    attr_accessor :crnt_snt_scre,:crnt_wrd_scre
    def initialize(file)
    SCRABBLE_SCORES={
                    1=>["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
                    2=>["D","G"],
                    3=>["B","C","M","P"],
                    4=>["F", "H", "V", "W", "Y"],
                    5=>["K"],
                    8=>["J", "X"],
                    10=>["Q","Z"]}
        @document=file
        @crnt_snt_scre=crnt_snt_scre
        @crnt_wrd_scre=crnt_wrd_scre
    end

    def report
        puts "Total Score of Entire Document : #{}"
    end

    
    def parsering_snt
        sentences=document.split("")
        sentences.each do 
        
    end

    def parsering_word

    end


    def set_hgt_scrb_scre(current,highest)
        if current.keys[0] > highest.keys[0]
            highest=current
        else
        return nil
    end

end

class Document < Processor
    attr_accessor :ttl_doc_scre

    def initialize
    @ttl_doc_scre=[]
    end

end


class Sentence < Document
    attr_accessor :crnt_snt_scre,:hgt_snt_scre

    def initialize
    @crnt_snt_scre={1=>["one word"]}
    @hgt_snt_scre={1=>["one word"]}
    end

end

class Word < Sentence
    attr_accessor :crnt_wrd_scre,:hgt_wrd_scre

    def initialize
    @crnt_wrd_scre={1=>["one"]}
    @hgt_wrd_scre={1=>["one"]}
    end

end

# DRIVER CODE
Input.new("Scrabble_Document.txt")
