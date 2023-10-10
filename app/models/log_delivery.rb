class LogDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :log_id, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short" }, numericality: { only_integer: true, message: "is invalid. Input only number" }
    validates :token, presence: true
    validates :item_id, presence: true 
    validates :user_id, presence: true
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # バリデーションチェック
    return false unless valid?
  
    log = Log.create(user_id: user_id, item_id: item_id)
  
    delivery = Delivery.new(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      log_id: log.id
    )
  
    # 保存が成功した場合
    if log.save && delivery.save
      return true
    else
      errors.add(:base, 'Failed to save log or delivery')
      return false
    end
  end  
end
