class Video < ApplicationRecord
  belongs_to :user

  validates :name, :url, presence: true
  validate :check_video_url_extension

  private

  def check_video_url_extension
    unless !url.nil? && url.match?('.m3u8$')
      errors.add(:video, I18n.t(:url_extension_should_be_m3u8, scope: 'errors.messages'))
      throw :abort
    end
  end
end
