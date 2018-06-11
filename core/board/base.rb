module Board
  class Base
    attr_accessor :base

    def initialize
      @base = Array.new
    end

    def merge(new_blocks)
      temp_blocks = Array.new(@base)
      temp_blocks += new_blocks

      build(temp_blocks)
    end

    def build(temp_blocks)
      new_base = Array.new

      start_stop = find_start_stop(temp_blocks)
      stop = start_stop[1]
      last_block = start_stop[0]

      new_base << temp_blocks.delete(last_block)

      loop do
        this_block = find_next(last_block, temp_blocks)

        if this_block == stop
          new_base << this_block
          break
        end

        if this_block
          last_block = this_block
          new_base << temp_blocks.delete(this_block)
        else
          last_block = new_base[new_base.find_index(last_block) - 1]
        end
      end

      @base = new_base
    end

    def find_start_stop(blocks)
      stacked = blocks.sort_by { |block| -block.position.y }
      stacked.minmax_by { |block| block.position.x }
    end

    def find_next(block, blocks)
      blocks.each do |next_block|
        return next_block if next_block.is_above_left_of(block)
      end

      blocks.each do |next_block|
        return next_block if next_block.is_above(block)
      end

      blocks.each do |next_block|
        return next_block if next_block.is_right_of(block)
      end

      blocks.each do |next_block|
        return next_block if next_block.is_below(block)
      end

      false
    end
  end
end