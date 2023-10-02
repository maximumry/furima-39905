class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_info
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :info, :price, presence: true

  validates :category_id, :condition_id, :burden_info_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
end
