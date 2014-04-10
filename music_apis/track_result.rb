require 'ostruct'
module MusicApis
  class TrackResult < OpenStruct
    attr_accessor :api_name, :api_id, :track
  end
end