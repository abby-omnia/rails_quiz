class Product < ApplicationRecord
    has_many :subscribers , dependent: :destroy #如果產品被刪除了，相關的訂閱紀錄也會一併刪除，保持資料庫乾淨。
    has_one_attached :featured_image
    has_rich_text :description
    validates :name , presence: true
    validates :inventory_count , numericality:  { greater_than_or_equal_to: 0 }
end
