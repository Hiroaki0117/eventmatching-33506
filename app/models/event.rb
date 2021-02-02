class Event < ApplicationRecord
  has_one_attached :image
  has_one :entry
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :area
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :date
    validates :capacity
    validates :place
  end
  with_options numericality: { other_than: 1, message: "を選択してください" }, presence: true do
    validates :genre_id
    validates :area_id 
  end

  def self.search(search)
    if search != ""
      Event.where('name LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end
end
