class ScraperManager
	def self.process(username)
		obj = new(username)
		obj.run
	end

	def run
		return false if @username.blank?

		load_ddg_data
		grab_ddg_data(@username)
		true
	end

	def initialize(username)
		@username = username
		@results = {}
	end

	def load_ddg_data
		ddg_search = DuckDuckGoSearch.find_by(query: @username)
		@results = DuckDuckGoResult.where(duck_duck_go_search_id: ddg_search.id) if ddg_search
	end

  def grab_ddg_data(ddg_username)
    encoded_query = URI.encode_www_form_component("\"" + ddg_username +"\"")
    url = "https://duckduckgo.com/html/?q=#{encoded_query}"
    
    # Send the GET request to DuckDuckGo search page
    response = HTTParty.get(url)
  
    # Parse the HTML response using Nokogiri
    doc = Nokogiri::HTML(response.body)
  
    # Find the result links and their descriptions on the search results page
    results = doc.css('.result__a') # Titles (links)
    descriptions = doc.css('.result__snippet') # Descriptions (snippets)
		return if results.empty?
		
		# Check if there are results
		ddg_search = DuckDuckGoSearch.find_or_create_by(query: ddg_username)
		results.each_with_index do |result, index|
			title = result.text.strip # Title of the result
			link = result['href'] # URL of the result
			description = descriptions[index].blank? ? descriptions[index].text.strip : "No description available." # Description of the result
			next if ddg_search.duck_duck_go_results.where(title: title, link: link, description: description).exists?
			ddg_search.duck_duck_go_results.create(title: title, link: link, description: description)
    end
  end
end