# Notas generales para revisar
# Los objetos no se tienen que instanciar, solo tiene que haber una referencia a ellos



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
  end

end


class Piece

  attr_reader :name

  def initialize color, name
    @color = color.downcase
    @name = name
  end
  
end

# Peon
# bP or wP

class Pawn < Piece
  def initialize color, name
    super(color, name)
  end

  def move
    # Si la posicion de la ficha es mayor de 2 posiciones sobre su posición inicial.
    # No puede hacer un movimiento de 2 posiciones.
    if (@color == 'black')
      #Mover board[0] + 1
    elsif (@color == 'white')
      #Mover board[0] - 1
    end
  end
end

# Caballo
# bB or wB

class Knight < Piece
  def initialize color, name
    super(color, name)
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
validator.show_boardvalidator.show_board