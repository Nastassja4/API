class ApplicationController < ActionController::Base
  private
    def headers
      { 'Content-Type' => 'application/json' }
    end

    def base_url
      "http://localhost:3000/api/v1/"
    end
end
