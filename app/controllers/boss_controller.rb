class BossController < ApplicationController
  def index
  end

  def step1_website_type
    # style = ["game", "web"]
    # key_word = ""
    # for key in style
    #     key_word << key + "+"
    # end
    
    # @data = []
    # html = Nokogiri::HTML(HTTParty.get("https://dribbble.com/search?q=#{key_word}"))
    # for search_result in html.css("ol li.group")[0..3]
    #     hash = {}
    #     tags = []
    #     content = Nokogiri::HTML(HTTParty.get("https://dribbble.com#{search_result.css("a").first['href']}"))
    #     for i in content.css("#tags li")
    #         tags << i.text.match(/\n\s+(.+)\n/).captures[0]
    #     end
    #     hash["tags"] = tags
    #     hash["img"] = search_result.css("img")[0]["src"]
    #     @data << hash
    # end
    # @data
    style = ["graph", "information"]
    key_word = ""
    for key in style
        key_word << key + "%20"
    end
    headers = {'cookie'=> 'ilo0=true',                
                'Host'=> 'www.behance.net',
                'Connection'=> 'keep-alive'
            }

    @data = []

    for page in (0..3)
        page = page*12

        html = Nokogiri::HTML(HTTParty.get("https://www.behance.net/search?ordinal=#{page}&search=#{key_word}",headers: headers))
        for result in html.css(".project-cover")
            hash = {}
            tags = []
            hash["img"] = result.css(".cover-img-el img")[0]["srcset"].split(",").first rescue nil
            for i in result.css(".cover-fields a")
                tags << i.text
            end
            hash["tags"] = tags
            @data << hash
        end
    end
    @data
  end

  def step2_style
  end

  def step3_detail
  end
end
