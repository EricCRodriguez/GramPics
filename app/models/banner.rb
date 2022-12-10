class Banner < ApplicationRecord
  mount_uploader :image, ImageUploader
  default_scope { order(start_time: :desc) }

  validates :title, presence: true
  validates :url, presence: true
  validates :image, presence: true

  scope :active, -> { where active: true }

  before_validation :set_default_duration

  def self.image_path position
    x = self.select(:id,:image,:url).where("position = ? AND start_time < ? AND end_time > ? AND active = ?", position, Time.now, Time.now, true).sample
  end

  def set_default_duration
    self.start_time = 1.minute.from_now unless self.start_time.present?
    self.end_time = 1.week.from_now unless self.end_time.present?
  end

end
