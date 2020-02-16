
class PigLatinizer

  def vowel?(*chars)
    chars.any? { |char| char.match(/[aAeEiIoOuU]/) }
  end  

  def piglatinize(string)
    string.split(" ").length == 1 ? 
      piglatinize_word(string) : piglatinize_sentence(string)
  end  

  def piglatinize_word(string)
    chars = string.split("")
    if vowel?(string[0])
      string = string + "w"
    elsif !vowel?(string[0], string[1], string[2]) 
      string = string.split("").rotate(3).join
    elsif !vowel?(string[0], string[1])
      string = string.split("").rotate(2).join
    else
      string = string.split("").rotate.join
    end  
    string << "ay"
  end

  def piglatinize_sentence(string) 
    string.split.collect { |word| piglatinize_word(word) }.join(" ") 
  end

end 

