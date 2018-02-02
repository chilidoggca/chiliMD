class Scraper
  attr_accessor :mechanizer, :is_doi, :url

  def initialize(url, options = {doi: false})
    @mechanizer = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    @url = url
    @is_doi = options[:doi]
  end

  def scrape
    is_doi ? doi_scrape : regular_scrape

  end

  def regular_scrape
    mechanizer.get(url) do |page|
      return {
        body: page.title
      }
    end
  end

  def doi_scrape
    headers = {
      "Accept" => "text/x-bibliography; style=apa"
    }
    mechanizer.get(url, [], nil, headers) do |page|
      return {
        body: page.body
      }
    end
  end



end
