
class Input
    attr_reader :processor
    def initialize(file)
    @processor=Processor.new
    end
    Processor.report
end

class Document
    attr_accessor :ttl_doc_scre,:document
    def initialize(file)
    @ttl_doc_scre=ttl_doc_scre
    @document=document
    end
    File.open(file, "r"){ |file| @document = file.read }
    
end

class Sentence < Document
    attr_accessor :crnt_snt_scre,:hgt_snt_scre

    def initialize
    @crnt_snt_scre={"nil"=>0}
    @hgt_snt_scre={"nil"=>0}
    end

end

class Word < Sentence
    attr_accessor :crnt_wrd_scre,:hgt_wrd_scre

    def initialize
    @crnt_wrd_scre={"nil"=>0}
    @hgt_wrd_scre={"nil"=>0}
    end

end

class Processor
    attr_reader :scrabble_scores
    attr_accessor :document
    def initialize
    @scrabble_scores= {
                    "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1,
                    "D"=>2,"G"=>2,
                    "B"=>3,"C"=>3,"M"=>3,"P"=>3,
                    "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4,
                    "K"=>5,
                    "J"=>8, "X"=>8,
                    "Q"=>10,"Z"=>10}
        @document=document
    end

    def report
        puts "Total Score of Entire 'Document' : #{Document.ttl_doc_scre}"
        puts "Highest Score of 'Sentence' : #{Sentence.hgt_snt_scre.values[0]}"
        puts Sentence.hgt_snt_scre.keys[0]
        puts "Highest Score of 'Word' : #{Word.hgt_snt_scre.values[0]}"
        puts Word.hgt_snt_scre.keys[0]
    end

    def parsering_document
        document_score=0
        splited_document=Document.document.split(".||?")
        splited_document.each do |sentence|
            document_score += self.parsering_sentence(sentence)
        end
        Document.ttl_doc_scre=document_score
        return document_score
    end

    def parsering_sentence(sentence)
        sentence_score=0
        splited_sentence=sentence.split(" ")
        splited_sentence.each do |word|
             sentence_score += self.parsering_word(word)
        end
        Sentence.crnt_snt_scre={sentence=>sentence_score}
        self.set_hgt_scrb_scre(Sentence.crnt_snt_scre,Sentence.hgt_snt_scre)
        return sentence_score
    end

    def parsering_word(word)
        word_score=0
        splited_word=word.split("")
        splited_word.each do |char|
            char.upcase!
            if self.scrabble_scores.keys.include? char
                word_score += self.scrabble_scores[char]
            else nil
            end
        end
        Word.crnt_wrd_scre={word=>word_score}
        self.set_hgt_scrb_scre(Word.crnt_wrd_scre,Word.hgt_wrd_scre)
        return word_score
    end

    def set_hgt_scrb_scre(current,highest)
        if current.values[0] > highest.values[0]
            highest=current
        else
        return nil
    end

end
end


# DRIVER CODE
Input.new("Scrabble_Document.txt")
