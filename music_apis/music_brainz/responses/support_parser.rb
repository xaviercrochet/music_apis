require 'music_apis/music_brainz/responses/artist_parser'
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
            artist_results: build_artists(support_json["artist-credit"])
            )
        end

      private

        def build_support(support_json)
          support = ::Support.new
          support.title = support_json["title"]
          support.catalog_number = support_json["label-info"].first["catalog-number"]
          support.bar_code = support_json["barcode"]
          support.format = support_json["media"].first["format"]
          support.label = build_label(support_json["label-info"])
          return support
        end

        def build_artists(artists_json)
          artists_json.map do |artist_json|
            ArtistParser.new(artist_json).artist_result
          end
        end

        def build_label(label_json)
          label_json.first["label"]["name"]
        end
      end
    end
  end
end