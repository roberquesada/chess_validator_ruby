# Notas generales para revisar
# Los objetos no se tienen que instanciar, solo tiene que haber una referencia a ellos



class Validator

  def initialize chess_board
    @chess_board = chess_board
  end

  def new_game
    #Hacer un for
      @chess_board.add_piece(:bR, 0, 0)
      @chess_board.add_piece(:bN, 1, 0)
      @chess_board.add_piece(:bB, 2, 0)
      @chess_board.add_piece(:bQ, 3, 0)
      @chess_board.add_piece(:bK, 4, 0)
      @chess_board.add_piece(:bB, 5, 0)
      @chess_board.add_piece(:bN, 6, 0)
      @chess_board.add_piece(:bR, 7, 0)

      for pawn_position in 0..7
        @chess_board.add_piece(:bP, pawn_position , 1)
      end

      @chess_board.add_piece(:wR, 0, 7)
      @chess_board.add_piece(:wN, 1, 7)
      @chess_board.add_piece(:wB, 2, 7)
      @chess_board.add_piece(:wQ, 3, 7)
      @chess_board.add_piece(:wK, 4, 7)
      @chess_board.add_piece(:wB, 5, 7)
      @chess_board.add_piece(:wN, 6, 7)
      @chess_board.add_piece(:wR, 7, 7)

      for pawn_position in 0..7
        @chess_board.add_piece(:wP, pawn_position , 6)
      end
  end

  def show_board
    @chess_board.board.each do |array_pieces|

      result = ''

      array_pieces.each do |piece|
        if piece == nil
          result += " -- "
        else
          result += " #{piece.name} "
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

  def add_piece hash_key, position_horizontal, position_vertical
    @board[position_vertical][position_horizontal] = @pieces[hash_key][0].new(@pieces[hash_key][1], @pieces[hash_key][2])
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
  def initialize color, name
    super(color, name)
  end
end

# Torre
# bR or wR

class Rook < Piece
  def initialize color, name
    super(color, name)
  end
end

# Reina
# bQ or wQ

class Queen < Piece
  def initialize color, name
    super(color, name)
  end
end

# Rey
# bK or wK

class King < Piece
  def initialize color, name
    super(color, name)
  end
end


pieces = {
  bR: [Rook, 'black', 'bR'],
  bN: [Bishop, 'black', 'bN'],
  bB: [Knight, 'black', 'bB'],
  bQ: [Queen, 'black', 'bQ'],
  bK: [Queen, 'black', 'bK'],
  bP: [Pawn, 'black', 'bP'],
  wR: [Rook, 'white', 'wR'],
  wN: [Bishop, 'white', 'wN'],
  wB: [Knight, 'white', 'wB'],
  wQ: [Queen, 'white', 'wQ'],
  wK: [Queen, 'white', 'wK'],
  wP: [Pawn, 'white', 'wP']
}

validator = Validator.new(ChessBoard.new(pieces))
validator.new_game
validator.show_board