require "yaml"
require "pry"

def load_library(emoticons)
  emoticons = YAML.load_file('lib/emoticons.yml')
  hash = emoticons.each_with_object({}) do |(key, value), hash|
    if !hash[key]
      hash[key] = {}
    end
    if !hash[key][:english]
      hash[key][:english] = value[0]
    end
    if !hash[key][:japanese]
      hash[key][:japanese] = value[1]
    end
  end
end

def get_japanese_emoticon(emoticons, emoji)
    hash = Hash.new
      load_library(emoticons).find do |key, value| 
        if value[:english] == emoji
          hash = value
        elsif !value[:english].any? == emoji 
          puts "Sorry"
        #binding.pry
      end
      
          puts "YES"
        
   hash[:japanese]
end

def get_english_meaning(emoticons, emoji)
  hash = Hash.new
  load_library(emoticons).each do |key, value|
        if value[:japanese].include?(emoji)
          hash[:english] = key
        else
          hash[:english] = "Sorry, that emoticon was not found"
          #binding.pry
        end
      end   
      hash[:english]
  end



