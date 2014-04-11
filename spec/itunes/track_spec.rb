require 'music_apis/itunes/track'
require 'music_apis/itunes/responses/track_parser'
require 'track'
require 'artist'
describe MusicApis::Itunes::Track do

    let(:artist){ double(name: "David Guetta") }
    let(:track){ double(title: "World Is Mine", artists: [artist], isrc: nil) }

    it "Test Itunes queries" do
        search = MusicApis::Itunes::Track.search(track)
        expect(search.track_results.first.track).to be_a ::Track
        expect(search.track_results.first.track.title).to include "World Is Mine"
    end
end
