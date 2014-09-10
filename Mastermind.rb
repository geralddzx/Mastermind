class Code
  COLOURS={
    "R" => "Red", 
    "G" => "Green", 
    "B" => "Blue", 
    "Y" => "Yellow", 
    "O" => "Orange", 
    "P" => "Purple"
  }
  
  def self.random
    code = COLOURS.values.sample(4)
    p code
  end
  
  def self.parse guess
    user_guess = guess.split('').map {|colour| COLOURS[colour]}
  end
  
  def self.matches(code, user_guess)
    exact_matches = 0
    (0..3).each do |index|
      exact_matches += 1 if user_guess[index] == code[index]
    end
    near_guess = 0
    user_guess.each do |element|
      near_guess += 1 if code.include?(element)
    end
    return exact_matches, near_guess
  end
      
end

class Game

  def initialize
    @computercode = Code.random
    @humancode = []
  end
  
  def user_input
    puts "Make your guess"
    @humancode = Code.parse(gets.chomp.upcase)
  end
  
  def print_output
    result = Code.matches(@humancode, @computercode)
    puts "Exact matches: #{result[0]} Near matches: #{result[1]}"
  end
  
  def win?
    Code.matches(@humancode, @computercode)[0] == 4
  end
  
  def play
    turns = 1
    until win? || turns > 10
      puts "turn: #{turns}"
      user_input
      print_output
      turns += 1
    end
      puts "you win on turn#{turns}" if win? else puts 'out of turns' 
      # puts win? ? "..." : "...."
  end
end

Game.new.play
  