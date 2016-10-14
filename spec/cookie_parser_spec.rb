require "spec_helper"

require "net/http"
require "uri"

describe CookieParser do

  before(:each) do
    # get the cookie from a google request
    uri = URI.parse 'https://www.instagram.com/p/BLeOiwwhQy-/'
    http = Net::HTTP.new uri.host, uri.port
    request = Net::HTTP::Get.new uri.request_uri
    http.use_ssl = true
    resp, data = http.request request
    @cookie_string = resp.response['Set-Cookie']
    @cookie = CookieParser::Cookie.new @cookie_string
  end


  it "has a version number" do
    expect(CookieParser::VERSION).not_to be nil
  end

  it "should get cookie_string" do
    expect(@cookie_string).not_to be nil
  end

  it "should have attributes" do
    expect(@cookie.instance_variables.count).not_to eq 0
  end

  it "should get csrftoken" do
    expect(@cookie.csrftoken).not_to be nil
  end


end
