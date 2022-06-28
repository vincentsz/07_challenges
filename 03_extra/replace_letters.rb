# frozen_string_literal: true

ALPHABET = ('a'..'z').to_a.freeze
VOWELS = %w[a e i o u].freeze

def changer(word)
  result = word.downcase.chars.map do |char|
    if ALPHABET.include?(char)
      new_letter = ALPHABET[retrieve_new_index(char)]
      VOWELS.include?(new_letter) ? new_letter.upcase : new_letter
    else
      char
    end
  end
  result.join
end

def retrieve_new_index(char)
  (ALPHABET.index(char) + 1) % ALPHABET.size
end

p changer('Alice') == 'bmjdf'
p changer('sponge1') == 'tqpOhf1'
p changer('Hello World') == 'Ifmmp xpsmE'
p changer('dogs') == 'Epht'
p changer('z') == 'A'
