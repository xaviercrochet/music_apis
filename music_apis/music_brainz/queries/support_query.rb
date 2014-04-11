require 'music_apis/query'

module MusicApis
  module MusicBrainz
    module Queries
      class SupportQuery < MusicApis::Query

        PARAMS = [:release, :catno, :barcode]

      private
        def attribute_to_params
          {
            title:          :release,
            catalog_number: :catno,
            barcode:        :barcode
          }
        end


        def base_url
          'http://musicbrainz.org/ws/2/release?query='
        end

        def formatted_params
          @params.map do |k,v|
            "#{attribute_to_params[k]}:#{v}"
            end.join(' AND ')
        end

        def end_url
          '&fmt=json'
        end
      
      end
    end
  end
end
