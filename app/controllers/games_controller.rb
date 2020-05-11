require 'open-uri'
require 'nokogiri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(9)
  end

  def score
    @letters = params[:letters]
    @words = params[:word].upcase
    if compare?(@words, @letters)
      @answer = "yay"
    else
      @answer = "nope"
    end
  end

  def compare?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def scraper
    @html_content = open('https://wagon-dictionary.herokuapp.com/').read
    @doc = Nokogiri::HTML(html_content)
  end
end

# Il faudra utiliser open-uri et scraper l'API du Wagon en JSON
