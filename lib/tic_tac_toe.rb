class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize
        @board = nil || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        integer_input = input.to_i 
        user_friendly = integer_input - 1
        user_friendly
    end
    
    def move(index, player = "X")
        @board[index] = player
    end

    def position_taken?(position)
        if @board[position] == "X"
            return true
        elsif @board[position] == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position >= 0 && position <= 8
            if position_taken?(position)
                return false
            else
                return true
            end
        end
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        if turn_count.odd?
            return "O"
        else
            return "X"
        end
    end

    def turn
        input = gets.chomp
        index_input = input_to_index(input)
        if valid_move?(index_input)
            move(index_input, current_player)
            display_board
        else
            puts "Please do a valid input"
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win|
            win_index_1 = win[0]
            win_index_2 = win[1]
            win_index_3 = win[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return win
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return win
            else
                false
            end
        end
        if draw?
            return false
        end
    end

    def full?
       if @board.any?(" ")
            return false
       else 
            return true
       end
    end

    def draw?
        if full?
            WIN_COMBINATIONS.each do |win|
                win_index_1 = win[0]
                win_index_2 = win[1]
                win_index_3 = win[2]
    
                position_1 = @board[win_index_1]
                position_2 = @board[win_index_2]
                position_3 = @board[win_index_3]
    
                if position_1 == "X" && position_2 == "X" && position_3 == "X"
                    return false
                else
                    true
                end
            end
        end
    end

    def over?
        if won? || draw? 
            return true
        else
            return false
        end
    end

    def winner
        if win = won?
            @board[win.first]
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        end
        if draw?
            puts "Cat's Game!"
        end
    end

end