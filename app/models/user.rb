class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :logs

  validates :nickname, presence: { message: "can't be blank"}
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }
  validates :last_name, presence: { message: "can't be blank"}, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name, presence: { message: "can't be blank"}, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
  validates :kana_last, presence: { message: "can't be blank"}, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :kana_first, presence: { message: "can't be blank"}, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birth_day, presence: { message: "can't be blank"}
end