class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_info
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :image, presence: { message: "can't be blank"}
  validates :name, presence: { message: "can't be blank"}
  validates :info, presence: { message: "can't be blank"}
  validates :category_id, :condition_id, :burden_info_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: { message: "can't be blank" }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is out of setting range" }
end
