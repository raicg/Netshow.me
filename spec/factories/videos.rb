FactoryBot.define do
  factory :video do
    name { FFaker::Name.unique.name }
    url { 'video_url.m3u8' }
    user { User.last || create(:user) }
  end
end
