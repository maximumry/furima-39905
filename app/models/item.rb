class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_info
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :image, presence: { message: "can't be blank" }
  validates :name, presence: { message: "can't be blank" }
  validates :info, presence: { message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_info_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: { message: "can't be blank" }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
  validates :price, numericality: { only_integer: true,message: "is invalid. Input half-width characters" }
end
