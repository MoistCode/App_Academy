class Book
  attr_accessor :title, :list_of_words

  def initialize
    @list_of_words =
      File.readlines("./lib/articles_and_conjunctions.txt").map{|el| el.chomp}
  end

  def title=(input_title)
    @title = input_title
    capitalize_title
    @title

  end

  def capitalize_title
    @title = @title.split(" ").map.with_index do |word, idx|
      if (idx == 0 ||
         idx == @title.count(" ") + 1 ||
         !@list_of_words.include?(word.downcase))
        word.capitalize
      else
        word
      end
    end.join(" ")
  end


end
