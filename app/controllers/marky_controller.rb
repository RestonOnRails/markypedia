require 'wikipedia'
require 'marky_markov'

class MarkyController < ApplicationController

  def index
    page = Wikipedia.find('Getting Things Done')
    
    markov = MarkyMarkov::TemporaryDictionary.new 
    markov.parse_string page.text.split("\n").first
    sentences = markov.generate_n_sentences(5)
  end
  
end
