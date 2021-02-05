plainText = ""
shift = 0

def ask(question)
    answer = ''
    while answer.empty? do
      print question 
      answer = gets.chomp
    end
    answer
end

def translate(message, shift, result = '')
    message.each_char do |char|
      base = char.ord < 91 ? 65 : 97
      # Modifies Lowercase & Uppercase
      if char.ord.between?(65, 90) || char.ord.between?(97, 122)
        rotation = (((char.ord - base) + shift) % 26) + base
        result += rotation.chr
      # Keeps spaces & punctuation
      else
        result += char
      end
    end
    result
  end
 
plainText = ask("What would you like to encrypt? ")

while shift == 0 do
    shift =  ask("What is the shift number? ").to_i
end

cipherText = translate(plainText, shift)

puts cipherText
cipherText
