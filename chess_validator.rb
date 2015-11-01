# Notas generales para revisar
# Los objetos no se tienen que instanciar, solo tiene que haber una referencia a ellos
# Los objetos tienen que tener referencias!!!


module Movements

  def move_horizontal init_pos, end_pos
    if init_pos[0] == end_pos[0]
      init_pos[1] = end_pos[1]
      init_pos
    end
  end

  def move_vertical init_pos, end_pos
    if init_pos[1] == end_pos[1]
      init_pos[0] = end_pos[0]
      init_pos
    end
  end

  def move_diagonal

  end

end

class Validator

  def initialize chess_board
    @chess_board = chess_board
  end

  def new_game

    position = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R']

    8.times { |i| @chess_board.add_piece(('b' + position[i]).to_sym, [0, i]) }
    8.times { |i| @chess_board.add_piece(:bP, [1, i]) }
    8.times { |i| @chess_board.add_piece(('w' + position[i]).to_sym, [7, i]) }
    8.times { |i| @chess_board.add_piece(:wP, [6, i]) }

  end

  def show_board
    @chess_board.board.each do |array_pieces|

      result = ''

      array_pieces.each do |piece|
        if piece == nil
          result += " -- "
        else
          result += " #{piece} "
        end
      end

      puts result

    end
  end

  def make_move init_position, end_position
    if @chess_board.move_piece(init_position, end_position)
      puts "TRUE"
    else
      puts "FALSE"
    end
  end

end

class ChessBoard

  attr_reader :pieces, :board

  def initialize pieces
    @pieces = pieces
    @board = Array.new(8) {Array.new(8)}
  end

  def add_piece hash_key, position
    @board[position[0]][position[1]] = @pieces[hash_key][:name].to_sym
  end

  def move_piece init_pos, end_pos
    piece = @pieces[@board[init_pos[0]][init_pos[1]]]
    new_piece = piece[:class_name].new(piece[:color], piece[:name], [init_pos[0],init_pos[1]])
    current_pos = [init_pos[0],init_pos[1]]
    end_pos_piece = [end_pos[0],end_pos[1]]
    new_piece.move_piece([end_pos[0],end_pos[1]])
    new_pos_piece = new_piece.position
    end_pos_piece == new_pos_piece && @board[new_pos_piece[0]][new_pos_piece[1]] == nil
    
  end

end


class Piece

  include Movements
  attr_reader :position

  def initialize color, name, position
    @color = color.downcase
    @name = name
    @position = position
  end
  
end

# Peon
# bP or wP

class Pawn < Piece
  def initialize color, name, position
    super(color, name, position)
  end

  def move_piece position

    pos_dif = (@position[0] - position[0]).abs

    if pos_dif <= 2
      if (@color == 'black')
        if @position[0] >= 1
          @position[0] += pos_dif
        else
          @position[0] += 1
        end
      elsif (@color == 'white')

        if @position[0] >= 6
          @position[0] -= pos_dif
        else
          @position[0] -= 1
        end
      end
    end
  end

end

# Caballo
# bB or wB

class Knight < Piece
  def initialize color, name, position
    super(color, name, position)
  end
end

# Alfil
# bN or wN

class Bishop < Piece
  def initialize color, name, position
    super(color, name, position)
  end

  end
end

# Torre
# bR or wR

class Rook < Piece
  def initialize color, name, position
    super(color, name, position)
  end

  def move_piece end_pos
    move_horizontal(@position, end_pos) || move_vertical(@position, end_pos)
  end

end

# Reina
# bQ or wQ

class Queen < Piece
  def initialize color, name, position
    super(color, name, position)
  end
end

# Rey
# bK or wK

class King < Piece
  def initialize color, name, position
    super(color, name, position)
  end
end


pieces = {
  bR: {class_name: Rook, color: 'black', name: 'bR'},
  bN: {class_name: Bishop, color: 'black', name: 'bN'},
  bB: {class_name: Knight, color: 'black', name: 'bB'},
  bQ: {class_name: Queen, color: 'black', name: 'bQ'},
  bK: {class_name: King, color: 'black', name: 'bK'},
  bP: {class_name: Pawn, color: 'black', name: 'bP'},
  wR: {class_name: Rook, color: 'white', name: 'wR'},
  wN: {class_name: Bishop, color: 'white', name: 'wN'},
  wB: {class_name: Knight, color: 'white', name: 'wB'},
  wQ: {class_name: Queen, color: 'white', name: 'wQ'},
  wK: {class_name: King, color: 'white', name: 'wK'},
  wP: {class_name: Pawn, color: 'white', name: 'wP'},
}

validator = Validator.new(ChessBoard.new(pieces))
validator.new_game
validator.show_board
validator.make_move([0,0], [1,4])

#Los valores se asignan de manera vertical y horizontal