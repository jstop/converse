class Program < ApplicationRecord
    serialize :preferences, JSON
  #JSON_OBJECT = 
  def title
    "#{self.payload["topic_menu"]["menu_data"][0]["title"]}: #{self.payload["topic_menu"]["menu_data"][1]["title"]}"
  end
  def estimated_content_length_text
    self.payload["curriculum"]["estimated_content_length_text"]
  end
  def sections
    self.payload["curriculum"]["sections"]
  end
  def provider
    "Udemy.com"
  end
  def link
    "https://udemy.com#{self.payload["curriculum"]["sections"].first["items"].first["landing_page_url"]}"
  end
  def sections 
    payload["curriculum"]["sections"]
  end
end
