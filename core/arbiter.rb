class Arbiter

  class << self
    def query(shape, base)
      shape.blocks.any? { |block| overlap(block, base.blocks) }
    end

    def overlap(block, base_blocks)
      base_blocks.any? { |base_block| base_block == block }
    end
  end
end