require 'open-uri'

class GamesController < ApplicationController
  def new
    @random_letters = []
    10.times {
      @random_letters << ("a".."z").to_a.sample.upcase
    }
  end
  def score
    @proposition = params[:word].upcase.split("").reject{|x| x==" "}
    @random_letters = params[:letters].split()

    @build_test = @proposition.all? { |letter| @proposition.count(letter) <= @random_letters.count(letter) }

    url = "https://wagon-dictionary.herokuapp.com/#{@proposition.join("")}"
    @dico_test = JSON.parse(open(url).read)["found"]

  end
end
