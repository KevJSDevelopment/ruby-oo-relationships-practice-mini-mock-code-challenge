require 'pry'
require_relative './book.rb'

class Author

    attr_reader :name
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def books
        Book.all.select do |book|
            book.author == self
        end
    end

    def write_book(title, word_count)
        Book.new(self, title, word_count)
    end

    def total_words
        sum = 0
        self.books.each do |book|
            sum += book.word_count
        end
        sum
    end

    def self.most_words
        most_words = Author.all.sort_by(&:total_words)
        most_words[most_words.length - 1]

        #Other ways to complete -
            # Author.all.max_by do |author_champion|
            #     author_champion.total_words
            # end
    end

end
        
author = Author.new("Bob")
author.write_book("bob the builder", 56)

author2 = Author.new("George")
author2.write_book("Curious George", 14)

author2 = Author.new("Gene")
author2.write_book("Gene", 154)
