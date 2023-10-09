class LogDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :log_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :house_number
    validates :building_name
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "number is too short" }, numericality: { only_integer: true, message: "Phone number is invalid. Input only number" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 購入情報を保存した
    log = Log.create(user_id: user_id, item_id: item_id)
    # 配送情報を保存し、変数deliveryに代入（仮）
    # log_idはlog変数のidを指定
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: pzxzxhone_number, log_id: log.id)
  end
end
