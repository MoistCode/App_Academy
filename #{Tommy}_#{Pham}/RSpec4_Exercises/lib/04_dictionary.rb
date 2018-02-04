class Dictionary
  attr_accessor :entries

  def initialize(entries = {})
    @entries = entries
  end

  def add(hsh)
    if hsh.class == Hash
      hsh.each {|k, v| entries[k] = v}
    else
      entries[hsh] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(string)
    keywords.each do |k|
      return true if k == string
    end
    false
  end

  def find(string)
    @entries.select do |k, v|
      k.match(/#{string}/)
    end
  end

  def printable
    string = ""
    @entries.sort_by{|k, v| k}.each do |el|
      string += %Q{[#{el.first}] "#{el.last}"}
      string += "\n" if el.first != entries.keys.sort.last
    end
    string
  end

end
