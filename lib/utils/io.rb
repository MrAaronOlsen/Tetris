module Tetris
  class IO
    attr_reader :score_file

    def initialize
      @score_file = Pathname.new(File.expand_path('../resources/scores.txt', File.dirname(__FILE__)))

      @Score = Struct.new(:score, :lines, :level)
      sanity_check
    end

    def sanity_check
      File.open(@score_file, "w") if !@score_file.exist?
    end

    def load_scores
      [].tap do |score|
        File.readlines(@score_file, :chomp => true).each do |line|
          score.push(parse_score(line))
        end
      end
    end

    def write_lines_to(path, lines)
      File.open(path, "w") do |file|
        lines.each { |line| file.write(make_line(line) + "\n") }
      end
    end

    def parse_score(score)
      split_score = score.split(",")
      @Score.new(split_score[0], split_score[1], split_score[2])
    end

    def make_line(score)
      "#{score.score},#{score.lines},#{score.level}"
    end

    def add_score(score)
      scores = load_scores

      scores.push(@Score.new(score.score, score.lines, score.level))
      scores.sort { |a, b| b.score <=> a.score }.pop if scores.size > 10

      write_lines_to(@score_file, scores)
    end
  end
end