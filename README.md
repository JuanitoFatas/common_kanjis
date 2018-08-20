# Common Kanjis

Data from [MJ文字情報API][mojikiban] of [IPA Information-technology Promotion Agency, Japan][ipa].

As of August 20, 2018, there are 2136 common kanjis.

## `common_kanjis.json` Format

```json
{
  "count":2136,
  "results": [
    {
      "word": "丁",
      "Chinese Reading": ["チョウ","テイ","トウ"],
      "Japanese Reading": ["あたる","ひのと","よぼろ"]
    },
    ...
    {
      "word": "𠮟",
      "Chinese Reading": ["シツ"],
      "Japanese Reading": ["しかる"]
    }
  ]
}
```

## Update

Run `bin/fetch` and commit changes.

## Credits

[IPA Information-technology Promotion Agency, Japan][ipa]


[mojikiban]: http://mojikiban.ipa.go.jp/mji
[ipa]: https://www.ipa.go.jp/index-e.html
