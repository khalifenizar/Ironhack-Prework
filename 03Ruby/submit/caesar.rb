class CaesarCipher
	def initialize(shift = -3)
		@alphabet = ('A'..'Z').to_a
		@shift = shift
	end

	def cipher(text, mode)
		charr = text.chars
		finalText = ""
		charr.each do |char|
			if(@alphabet.index(char.upcase) != nil)
				charIsUpper =(@alphabet.index(char) != nil)
				if(charIsUpper) #upper case
					finalText = finalText + shift(char, mode)
				else #lower case
					finalText = finalText + shift(char.upcase, mode).downcase
				end
			else #not alpha
				finalText = finalText + char
			end
		end
		return finalText
	end

	def shift(upperCaseChar, mode)
		if(mode == "encode")
			return @alphabet[(@alphabet.index(upperCaseChar) + @shift) % 26]
		elsif(mode == "decode")
			return @alphabet[(@alphabet.index(upperCaseChar) - @shift) % 26]
		end
	end


	def decode(cipherText)
		return cipher(cipherText, "decode")
	end

	def encode(plainText)
		return cipher(plainText, "encode")
	end
end

classic = CaesarCipher.new()
myAnimal = "Hello, I am a zebra named RALPH!"
cipher = classic.encode(myAnimal)
flipflop = classic.decode(cipher)

puts "Plaintext: #{myAnimal}"
puts "Ciphertext: #{cipher}"
puts "Plain back from cipher: #{flipflop}" 