class Kanji
  attr_reader :word, :chinese_reading, :japanese_reading

  def initialize(word:, chinese_reading:, japanese_reading:)
    @word = word
    @chinese_reading = chinese_reading
    @japanese_reading = japanese_reading
  end

  def to_h
    {
      "word" => word,
      "Chinese Reading" => chinese_reading,
      "Japanese Reading" => japanese_reading
    }
  end
end
