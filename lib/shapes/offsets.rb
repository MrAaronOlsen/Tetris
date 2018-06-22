class Shape
  class Offsets

    class << self
      def get_for(type)
        case type
        when "I"
          kick_offset_I
        when "O"
          kick_offset_O
        when "J", "L", "S", "Z", "T"
          kick_offset_JLSZT
        end
      end

      def kick_offset_JLSZT
        [ [ V.new( 0, 0), V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0) ],
          [ V.new( 0, 0),	V.new( 1, 0),	V.new( 1, 1),	V.new( 0,-2),	V.new( 1,-2) ],
          [ V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0, 0) ],
          [	V.new( 0, 0), V.new(-1, 0),	V.new(-1, 1),	V.new( 0,-2),	V.new(-1,-2) ] ]
      end

      def kick_offset_I
        [ [ V.new( 0, 0),	V.new(-1, 0),	V.new( 2, 0),	V.new(-1, 0),	V.new( 2, 0) ],
          [ V.new(-1, 0),	V.new( 0, 0),	V.new( 0, 0),	V.new( 0,-1),	V.new( 0, 2) ],
          [ V.new(-1,-1),	V.new( 1,-1),	V.new(-2,-1),	V.new( 1, 0),	V.new(-2, 0) ],
          [ V.new( 0,-1),	V.new( 0,-1),	V.new( 0,-1),	V.new( 0, 1),	V.new( 0,-2) ] ]
      end

      def kick_offset_O
        [ [ V.new( 0, 0) ],
          [ V.new( 0, 1) ],
          [ V.new(-1, 1) ],
          [ V.new(-1, 0) ] ]
      end
    end
  end
end