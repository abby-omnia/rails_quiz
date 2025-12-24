# Pin npm packages by running ./bin/importmap
# 將 "application" 名稱對應到 app/javascript/application.js (這是 JS 的入口點)
pin "application"

# 將 Turbo 與 Stimulus 套件對應到它們的編譯版本
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

# 自動將 app/javascript/controllers 資料夾下的所有檔案「釘 (pin)」起來
# 這樣你寫自定義 JS 時，不需要手動一行一行加
pin_all_from "app/javascript/controllers", under: "controllers"

# 針對我們之前安裝的富文本編輯器 Trix 所需的 JS
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
