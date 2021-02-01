class Event < ApplicationRecord
  has_one_attached :image
  has_one :entry
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :date
    validates :capacity
    validates :place
  end
  validates :genre_id, numericality: { other_than: 1, message: "を選択してください" }, presence: true
end
