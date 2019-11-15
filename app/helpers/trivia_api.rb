require 'rest-client'

class TriviaApi
  def initialize
    @url = "https://opentdb.com/api.php?amount=1&category=20"
    @categories = "https://opentdb.com/api_category.php"
    @@token ||= get_token
    @url = @url + "&token=" + get_token
  end

  def fetch_data(url)
    RestClient.get(url)
  end

  def get_token
    get_results(parse_response(fetch_data("https://opentdb.com/api_token.php?command=request")), "token")
  end

  def parse_response(response)
    JSON.parse response.body
  end

  def get_results(parsed_response, key)
    parsed_response[key]
  end

  def get_random_question
    get_results(parse_response(fetch_data @url), "results")[0]
  end

  def get_categories
    get_results(parse_response(fetch_data @categories), "trivia_categories")      
  end

  def change_category(category_id)
    append_url = "&category=#{category_id}"
    @url = @url.gsub /(&category=)\d\d/, append_url
  end

end 
