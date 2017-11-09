require 'sinatra'
require 'HTTParty'
require 'Nokogiri'

get '/' do

  if params[:job]
    @job = params[:job]
  else 
    @job = "sof"
  end

  url = "https://miami.craigslist.org/search/#{@job}"
  response = HTTParty.get(url)
  html = response.body
  dom = Nokogiri::HTML(html)
  @links = dom.css("a.hdrlnk")

  @i = 1

  erb :thing

end


