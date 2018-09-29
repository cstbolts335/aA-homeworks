class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over #until this game is over, we continue to play
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
  end

  def show_sequence
    self.add_random_color #calls the instance method that generates the random color that the user will then follow
    @seq.each do |col| #iterate through the sequence array where we are storing the moves
      puts color #show the user the color
      sleep 1 #for that delay effect
      system("clear") # this is the syntax for clearing the board
      sleep 0.25
    end
  end

  def require_sequence
    puts "Follow the screen you dummy"
    @seq.each do |col|
      get_color = gets.chomp
      unless color[0] == get_color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLOR.shuffle[3] #shuffles the array of COLORS and takes the 4th element at Index 3
  end

  def round_success_message
    "Nice!, here's the next one"
  end

  def game_over_message
    "You lost"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
