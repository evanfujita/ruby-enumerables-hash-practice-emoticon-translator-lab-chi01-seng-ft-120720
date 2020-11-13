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
          #binding.pry
        elsif false 
          hash[:japanese] = "Sorry, that emoticon was not found"
        end
      end
   hash[:japanese]
end

def get_english_meaning(emoticons, emoji)
    load_library(emoticons).find do |key, value|
        if value[:japanese] == emoji
            word = key
          elsif false
            word = "Sorry, that emoticon was not found"
        end
          word
        end   
  end



