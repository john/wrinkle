class WordpressService

  BASE_URL = "https://public-api.wordpress.com/wp/v2".freeze

  # "ID": 113736187
  # "display_name": "fnnny"
  # "username": "fnnny"
  # "email": "john@fnnny.com"
  # "primary_blog": 120507246
  # "primary_blog_url": "http://getwrinkle.wordpress.com"

  # https://developer.wordpress.com/docs/api/console/

  # /sites/120507246/posts
  def self.get_posts(user)
    site_id = user.organization.wordpress_auth.site_id
    response = RestClient.get( "#{BASE_URL}/sites/#{site_id}/posts" )
    JSON.parse(response.body)
  end



  # def post_json(path, data)
  #   response = RestClient.post("#{base_url}/#{path}", data, {Authorization: "Bearer #{access_token}"})
  #   JSON.parse(response.body)
  # end

  def self.create_document(post)
    response = RestClient.post("#{BASE_URL}/sites/#{site_id}/posts", data, {Authorization: "Basic #{Base64.encode64("john@fnnny.com:330CabSF")}"})
  end

end