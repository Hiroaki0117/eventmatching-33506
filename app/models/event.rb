class Event < ApplicationRecord
  has_one_attached :image
  has_many :entries, dependent: :destroy
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  belongs_to :start_time
  belongs_to :end_time
  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :day    
    validates :capacity
    validates :place
  end
  with_options numericality: { other_than: 1, message: "を選択してください" }, presence: true do
    validates :genre_id
    validates :area_id 
    validates :start_time_id
    validates :end_time_id
  end
  validate :time_start_end
  validate :day_start

  def self.search(search)
    if search != ""
      Event.where('name LIKE(?)', "%#{search}%") 
    else
      Event.all
    end
  end

  def time_start_end
    return if start_time_id.blank? || end_time_id.blank?
    errors.add(:end_time_id, "は開始時刻よりも後の時刻を選択してください") if start_time_id > end_time_id
  end

  def day_start
    return if day.blank?
    errors.add(:day, "は今日以降のものを選択してください") if day < Date.today
  end
end
