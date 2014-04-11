require 'music_apis/music_brainz/responses/artist_parser'
require 'music_apis/music_brainz/responses/label_parser'
require 'music_apis/support_result'
require 'support'

module MusicApis
  module MusicBrainz
    module Responses

      class SupportParser
        API_NAME = 'Music Brainz'

        attr_reader :support_result

        def initialize(support_json)
          @support_result = build(support_json)
        end

        def build(support_json)
          SupportResult.new(
            api_name: API_NAME,
            api_id: support_json["id"],
            support: build_support(support_json),
            artist_results: build_artists(support_json["artist-credit"]),
            label_result: build_label(support_json["label-info"])
            )
        end

      private

        def build_support(support_json)
          support = ::Support.new
          support.title = support_json["title"]
          support.catalog_number = support_json["label-info"].first["catalog-number"]
          support.bar_code = support_json["barcode"]
          support.format = support_json["media"].first["format"]
          return support
        end

        def build_artists(artists_json)
          artists_json.map do |artist_json|
            ArtistParser.new(artist_json).artist_result
          end
        end

        def build_label(label_json)
          LabelParser.new(label_json.first["label"]).label_result
        end
      end
    end
  end
end