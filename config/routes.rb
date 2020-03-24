Rails.application.routes.draw do
  # 動作確認用URL（サーバーサイド情報がまだないため仮ルート設定）
  get "/pruducts/1", to: 'products#show'
end
