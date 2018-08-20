require_relative "kanji"
require "http"

class GetCommonKanjis
  def self.run
    new.run
  end

  def run
    {
      "count" => kanjis_response.size,
      "results" => kanjis_response
    }
  end

  private

  ENDPOINT = "https://mojikiban.ipa.go.jp/mji/q?%E6%BC%A2%E5%AD%97%E6%96%BD%E7%AD%96=%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97"
  private_constant :ENDPOINT

  def kanjis_response
    @_kanjis_response ||= parsed_kanjis.map(&:to_h)
  end

  def parsed_kanjis
    common_kanjis.fetch("results").map do |kanji_response|
      Kanji.new(
        word: get_word(kanji_response),
        chinese_reading: get_chinese_reading(kanji_response),
        japanese_reading: get_japanese_reading(kanji_response),
      )
    end
  end

  def common_kanjis
    HTTP.get(ENDPOINT).parse
  end

  def hex2unicode(hex)
    [hex.to_i(16)].pack("U")
  end

  def get_word(response)
    codepoint = response["UCS"]["対応するUCS"].tr("U+", "")
    hex2unicode(codepoint)
  end

  def get_chinese_reading(response)
    response["読み"]["音読み"]
  end

  def get_japanese_reading(response)
    response["読み"]["訓読み"]
  end
end
