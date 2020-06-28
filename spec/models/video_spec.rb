require 'rails_helper'

RSpec.describe Video, type: :model do
  let!(:user){ create(:user) }
  let!(:video){ create(:video) }

  it 'name cannot be nil' do
    video.update(name: nil)
    video.reload
    expect(video.name).to_not be_nil
  end
  
  it 'url cannot be nil' do
    video.update(url: nil)
    video.reload
    expect(video.url).to_not be_nil
  end

  it 'user_id cannot be nil' do
    video.update(user_id: nil)
    video.reload
    expect(video.user_id).to_not be_nil
  end

  context 'when url extension is not .m3u8' do
    it 'url should not be persisted' do
      url = 'video_url.html'
      video.update(url: url)
      video.reload
      expect(video.url).to_not eq(url)
    end
  end

end
