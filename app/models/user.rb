class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は半角数字を入力してください" }
    validates :birth_day
    validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英数字混合にしてください' }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' } do
    validates :family_name
    validates :first_name
  end
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナ文字で入力してください" } do
    validates :kana_family_name
    validates :kana_first_name
  end

  has_many :events
  has_many :entries
  has_many :users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
