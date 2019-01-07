class Item < ApplicationRecord
  belongs_to :user
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :name, presence: true, length: { maximum: 40 }      # 「40文字以下」
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300 }
  # priceバリデーション可能であれば、正規表現を用いて表現する
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :item_categories

# show_error_message_imageメソッド（画像送信）において適切なバリデーションが出るように後で編集すること
  def show_error_message_image(item)
    if item == nil
      "不備があります"
    else
      ""
    end
  end

  def show_error_message_item(item)
    if item.length == 0
      "入力してください"
    elsif item.length > 40
      "40文字以下で入力してください"
    else
      ""
    end
  end

  def show_error_message_idescription(item)
    if item.length == 0
      "入力してください"
    elsif item.length > 1000
      "1000文字以下で入力してください"
    else
      ""
    end
  end

  def show_error_message_price(item)
    if (item.length == 0) || (item.to_i > 299) == false
      "300以上9999999以下で入力してください"
    else
      ""
    end
  end
end
