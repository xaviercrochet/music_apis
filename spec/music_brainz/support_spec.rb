require 'music_apis/music_brainz/support'
require 'music_apis/music_brainz/responses/support_parser'
require 'support'

describe MusicApis::MusicBrainz::Support do

  let(:support) {double(title: "Guetta Blaster", catalog_number: nil, bar_code: nil)}
  #, catalog_number: "571970-2", bar_code: nil)}

   it "Test Music Brainz Support Queries" do
    search = MusicApis::MusicBrainz::Support.search(support)
    expect(search.support_results.first.support).to be_a ::Support
    expect(search.support_results.first.support.title).to include "Guetta Blaster"
    expect(search.support_results.first.artist_results.first.artist.name).to include "David Guetta"
    expect(search.support_results.first.label_result.label).to be_a Label
  end
end
