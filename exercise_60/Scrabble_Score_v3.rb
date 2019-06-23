require 'byebug'
require "colorize"
class Input
    attr_reader :opened_doc 
    def initialize(file)
        @opened_doc=File.read(file)
    end
end

class Sentence
    attr_accessor :sentence,:score
    def initialize(sentence)
    @sentence=sentence
    # @score=score
    end

    def score
        score=0
        words=@sentence.split(" ")
        words.each do |word|
            word=Word.new(word)
            score += word.score
        end
        return score
    end
end

class Word
    attr_accessor :word,:score,:scrabble_score
    def initialize(word)
    @scrabble_score = {
        "A"=>1, "E"=>1, "I"=>1, "O"=>1, "U"=>1, "L"=>1, "N"=>1, "R"=>1, "S"=>1, "T"=>1,
        "D"=>2,"G"=>2,
        "B"=>3,"C"=>3,"M"=>3,"P"=>3,
        "F"=>4, "H"=>4, "V"=>4, "W"=>4, "Y"=>4,
        "K"=>5,
        "J"=>8, "X"=>8,
        "Q"=>10,"Z"=>10}
    @word=word
    # @score=score
    end

    def score
        score=0
        chars=@word.split("")
        chars.each do |char|
            char.upcase!
            if self.scrabble_score.include? char
                score += @scrabble_score[char]
            else
                nil
            end
        end
        return score
    end

end

class Processor
    attr_accessor :document,:sentences,:words,:sent_highest,:word_highest
    def initialize(document)
        @document=document
        @sentences={}
        @words={}
        @sent_highest={}
        @word_highest={}
    end
    # byebug
    def parsering_sentences
        self.document=self.document.split(".")
        # byebug
        self.document.each do |sentence|
            words=sentence.split(" ")
            words.each do |word|
                Word.new(word)
                # byebug
                self.words[word]=Word.new(word).score
                # byebug
            end
            Sentence.new(sentence)
            self.sentences[sentence]=Sentence.new(sentence).score
        
        end
    end
    def highest_sent_score
        highest=self.sentences.max_by{|k,v|v}
        @sent_highest[highest[0]]=highest[1]
    end

    def highest_word_score
        highest=self.words.max_by{|k,v|v}
        @word_highest[highest[0]]=highest[1]
    end
    
    def report
        self.parsering_sentences
        self.highest_sent_score
        self.highest_word_score
        puts "Total Score of Entire 'Document' :".green + "#{self.sentences.values.sum}".yellow
        puts
        puts "Highest Score of 'Sentence' :".green + "#{self.sent_highest.values.join}".yellow
        puts
        puts self.sent_highest.keys.join.yellow
        puts
        puts "Highest Score of 'Word' :".green + "#{self.word_highest.values.join}".yellow
        puts
        puts "#{self.word_highest.keys.join}".yellow
        puts

    end
end




document=Input.new("Scrabble_Document.txt")
processor=Processor.new(document.opened_doc)
processor.report