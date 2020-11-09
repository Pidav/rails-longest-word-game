require 'open-uri'

class GamesController < ApplicationController
  def new
    @random_letters = []
    10.times {
      @random_letters << ("a".."z").to_a.sample.upcase
    }
  end
  def score
    @proposition = params[:word].upcase
    @random_letters = params[:letters].split()
    @build_test = @proposition.split("").all? {|x| @random_letters.include?(x)}
    url = "https://wagon-dictionary.herokuapp.com/#{@proposition}"
    @dico_test = JSON.parse(open(url).read)["found"]

  end
end
