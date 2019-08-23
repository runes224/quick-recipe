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

  # #漢字をひらがなに変換する
  # # require 'mechanize'
  #
  # agent = Mechanize.new
  # url = agent.get('https://yomikatawa.com/kanji/')
  #
  # def to_hiragana(kanji)
  #     agent.get(url + kanji).search('#content p').first.inner_text
  # end
  #
  # def to_romaji(kanji)
  #   # agent = Mechanize.new
  #     # url = agent.get('https://yomikatawa.com/kanji/')
  #     agent.get('https://yomikatawa.com/kanji/' + '漢字').search('#content p')[1].inner_text
  # end

end
