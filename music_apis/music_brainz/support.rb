require 'music_apis/music_brainz/queries/support_query'
require 'active_support'
require 'active_support/core_ext/object/blank'
require 'music_apis/music_brainz/responses/support_parser'

module MusicApis
  module MusicBrainz
    class Support
      attr_reader :support_results

      def self.search(support)
        new(MusicBrainz::Queries::SupportQuery.search do
          title support.title if support.title.present?
          catalog_number support.catalog_number if support.catalog_number.present?
          bar_code support.bar_code if support.bar_code.present?
        end)
      end

      def initialize(response)
        @response = response
        @info = {created: response["created"], count: response["count"]}
        @support_results = response["releases"].map do |support_json|
          MusicApis::MusicBrainz::Responses::SupportParser.new(support_json).support_result
        end
      end

      def json
        @json
      end
    end
  end
end