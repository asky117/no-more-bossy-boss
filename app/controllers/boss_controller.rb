class BossController < ApplicationController
  def index
  end

  def step1_website_type
    style = ["game", "web"]
    key_word = ""
    for key in style
        key_word << key + "+"
    end
    
    @data = []
    html = Nokogiri::HTML(HTTParty.get("https://dribbble.com/search?q=#{key_word}"))
    for search_result in html.css("ol li.group")[0..3]
        hash = {}
        tags = []
        content = Nokogiri::HTML(HTTParty.get("https://dribbble.com#{search_result.css("a").first['href']}"))
        for i in content.css("#tags li")
            tags << i.text.match(/\n\s+(.+)\n/).captures[0]
        end
        hash["tags"] = tags
        hash["img"] = search_result.css("img")[0]["src"]
        @data << hash
    end
    @data
  end

  def analyze_result
    
  end

  def step2_style
  end

  def step3_detail
  end
end
