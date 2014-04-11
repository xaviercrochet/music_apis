require 'json'
require 'music_apis/music_brainz/responses/track_parser'
require 'music_apis/track_result'
require 'track'
require 'artist'

describe MusicApis::MusicBrainz::Responses::TrackParser do 
  it "Test structure" do
    response = File.read('spec/fixtures/track_music_brainz.json')
    tracks_json = JSON.parse(response)
    track_parser = MusicApis::MusicBrainz::Responses::TrackParser.new(tracks_json["recording"].first)
    expect(track_parser.track_result).to be_a MusicApis::TrackResult
    expect(track_parser.track_result.track).to be_a ::Track
    expect(track_parser.track_result.artist_results.first).to be_a MusicApis::ArtistResult
    expect(track_parser.track_result.artist_results.first.artist).to be_a ::Artist
    expect(track_parser.track_result.track.title).not_to be_nil
    expect(track_parser.track_result.artist_results.first.artist.name).not_to be_nil
  end
end