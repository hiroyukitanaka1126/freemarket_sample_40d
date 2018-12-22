class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }      # 「40文字以下」
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300 }
# numericality: :only_integer

  def show_error_message_item(item)
    if item.length == 0
      "入力してください"
    elsif item.length > 1000
      "1000文字以下で入力してください"
    elsif item.length > 40
      "40文字以下で入力してください"
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
