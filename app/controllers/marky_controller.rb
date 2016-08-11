require 'wikipedia'
require 'marky_markov'

class MarkyController < ApplicationController

  def index
    num_inputs = 2
    #input_urls = []
    @pages = []
  
    num_inputs.times do 
      #s = `curl -I https://en.wikipedia.org/wiki/Special:Random`.split("\r\n")
      #line = s.detect { |l| /^Location:/ === l }
      #input_urls << line.split("Location: ")[1]
      @pages << Wikipedia::Client.new.find_random
    end

    
        
    #@pages = [ 'Getting Things Done', 'The_Wake_(US_band)' ]
    markov = MarkyMarkov::TemporaryDictionary.new
    @pages.each do |page|
      #wpage = Wikipedia.find(page)
      markov.parse_string page.text.split("\n")[0..10].join("\n")
    end
    
    @sentences = []
    5.times do
      @sentences << markov.generate_n_sentences(1)
    end
  end
  
end
