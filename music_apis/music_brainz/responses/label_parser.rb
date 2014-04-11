require 'label'
require 'music_apis/label_result'
module MusicApis
  module MusicBrainz
    module Responses
      class LabelParser
        API_NAME = 'Music Brainz'

        attr_reader :label_result

        def initialize(label_json)
          @label_result = build(label_json)
        end

        def build(label_json)
          LabelResult.new(
            api_name: API_NAME,
            api_id: label_json["id"],
            label: build_label(label_json)
            )
        end

      private

        def build_label(label_json)
          label = ::Label.new
          label.name = label_json["name"]

        end
      end
    end
  end
end