require 'rails_helper'

RSpec.describe "/videos", type: :request do

  let!(:user) { create(:user) }
  let!(:video) { create(:video) }

  let!(:user2) { create(:user) }
  let!(:video2) { create(:video) }

  before { sign_in(user) }

  let(:valid_attributes) { build(:video).attributes }

  describe "GET /index" do
    it "renders a successful response" do
      get videos_url
      expect(response).to be_successful
    end

    it "only show videos created by user" do
      get videos_url
      expect(response.body).to_not include(video2.name)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get video_url(video)
      expect(response).to be_successful
    end

    it "shows video attributes" do
      get video_url(video)
      expect(response.body).to include(video.name)
      expect(response.body).to include(video.url)
      expect(response.body).to include(video.views.to_s)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_video_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_video_url(video)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Video" do
        expect {
          post videos_url, params: { video: valid_attributes }
        }.to change(Video, :count).by(1)
      end

      it "redirects to the created video" do
        post videos_url, params: { video: valid_attributes }
        expect(response).to redirect_to(video_url(Video.last))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { build(:video).attributes }

      it "updates the requested video" do
        patch video_url(video), params: { video: new_attributes }
        video.reload
        expect(video.name).to eq(new_attributes['name'])
      end

      it "redirects to the video" do
        patch video_url(video), params: { video: new_attributes }
        video.reload
        expect(response).to redirect_to(video_url(video))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested video" do
      expect {
        delete video_url(video)
      }.to change(Video, :count).by(-1)
    end

    it "redirects to the videos list" do
      delete video_url(video)
      expect(response).to redirect_to(videos_url)
    end
  end

  describe "GET /play" do
    it "renders a successful response" do
      get play_video_url(video)
      expect(response).to be_successful
    end

    it "shows video attributes" do
      get play_video_url(video)
      expect(response.body).to include(video.name)
      expect(response.body).to include(video.views.to_s)
    end

    it "shows video player" do
      get play_video_url(video)
      expect(response.body).to include('<video')
    end
  end
end
