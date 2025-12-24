class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    # 1. 從傳進來的參數包裡，把產品抓出來
    # 2. 把它貼上一個標籤「@」，這樣等等 View 範本才看得到它
    @product = params[:product]

    # 3. 呼叫 Rails 內建的「寄信小助手 (mail 方法)」
    # 4. 告訴小助手：請寄到這封信給這個人的 Email
    mail to: params[:subscriber].email
  end 
end
