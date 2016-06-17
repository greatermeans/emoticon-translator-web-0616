require 'yaml'
require 'pry'

def load_library(path)
  library = {"get_meaning" => {},"get_emoticon" => {}}
  YAML.load_file(path).each do |eng,mean_arr|
    library["get_meaning"][mean_arr[1]] = eng
    library["get_emoticon"][mean_arr[0]] = mean_arr[1]
  end
  library
end

def get_japanese_emoticon(path,emoticon)
  library = load_library(path)
  japanese_emo = library["get_emoticon"][emoticon]
  japanese_emo == nil ? (return "Sorry, that emoticon was not found") : japanese_emo
end

def get_english_meaning(path,emoticon)
  library = load_library(path)
  english_meaning = library["get_meaning"][emoticon]
  english_meaning == nil ? (return "Sorry, that emoticon was not found") : english_meaning
end