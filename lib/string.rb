
 class String
  #
  # Return 'words' in string upto len characters long
  def next_phrase(len = 40, sep = " ")
  	@next_word ||= 0
    @s ||= self.split
    result = ""
    until @s[@next_word].nil? || result.length + @s[@next_word].length/2 > len
      result += @s[@next_word] + sep 
      @next_word += 1
    end
    result.rstrip unless result.length == 0
  end

  def reset_phrase
  	 @next_word = 0
  	 @s = nil
  end
end

