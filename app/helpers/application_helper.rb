# frozen_string_literal: true
module ApplicationHelper
  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = 'QuickRecipie'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # デバイスのエラーメッセージ出力メソッド
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          #{msg}
        </div>
      EOF
    end
    html.html_safe
  end
end
