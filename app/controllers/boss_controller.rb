class BossController < ApplicationController
  def index
  end

  def step1_website_type
    style = ["ui", "web"]
    key_word = ""
    for key in style
        key_word << key + "%20"
    end

    html = Nokogiri::HTML(HTTParty.get("https://www.pinterest.com/search/pins/?q=#{key_word}"))
    @image = []
    for image in html.css("div.pinHolder > a > div.fadeContainer > div.Image.Module.pinUiImage > div > img")[0..10]
        @image << image["src"]
    end
  end

  def step2_style
  end

  def step3_detail
  end
end
