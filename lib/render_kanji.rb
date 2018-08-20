class RenderKanji
  def self.run(to:, common_kanjis:)
    new(to, common_kanjis).run
  end

  def initialize(to, common_kanjis)
    @to = to
    @common_kanjis = common_kanjis
  end

  def run
    File.open(to, "w") do |file|
      file.puts title
      file.puts table_header
      file.puts table_divider
      common_kanjis.each do |kanji|
        row = generate_row(
          kanji["word"],
          display_reading(kanji["Chinese Reading"]),
          display_reading(kanji["Japanese Reading"])
        )
        file.puts(row)
      end
    end
  end

  private

  attr_reader :to, :common_kanjis

  def display_reading(reading)
    if reading
      reading.join(", ")
    end
  end

  def title
    "# List of Common Kanjis"
  end

  def table_header
    "| Word | Chinese Reading | Japanese Reading |"
  end

  def table_divider
    "| -- | -- | -- |"
  end

  def generate_row(word, chinese, japanese)
    "| #{word} | #{chinese} | #{japanese} |"
  end
end
