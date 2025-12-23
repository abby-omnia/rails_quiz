class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # 使用 around_action 確保語系設定涵蓋整個 request 週期
  around_action :switch_locale
  def switch_locale(&action)
    # 優先讀取參數中的 locale (例如 ?locale=es)，否則使用預設語系
    locale = params[:locale] || I18n.default_locale
    # 設定並執行完動作後自動重設回預設語系
    I18n.with_locale(locale , &action)
  end
end