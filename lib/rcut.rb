module Rcut
  class Rcut
    def initialize
      @url = ARGV[0]
    end

    def cutit
      make_request
      if @response["status"] == "OK"
        puts "Here is your shortened url: "+ @response["shortened_url"].to_s
      else
        puts @response["error"].to_s
      end
    end

    private

    def make_request
      request   = URI("http://cutrl.herokuapp.com/cuts/create.json") 
      @response = JSON.parse(Net::HTTP.post_form(request, 'cut[url]' => "#{@url}").body)
    end
  end
end
