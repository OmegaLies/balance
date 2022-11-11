require "net/http"
require "rexml/document"
require_relative "lib/balance"

URL = "http://www.cbr.ru/scripts/XML_daily.asp".freeze

begin
  response = Net::HTTP.get_response(URI.parse(URL))
  doc = REXML::Document.new(response.body)
  dollar_rate = REXML::XPath.first(doc, '//Valute[@ID="R01235"]').get_text('Value').to_s.gsub(',', '.').to_f
  puts "Курс доллара: #{dollar_rate}"
rescue SocketError
  puts "Сайт Центробанка недоступен. Проверьте интернет соединение"
  puts "Введите курс доллара"
  dollar_rate = STDIN.gets.to_f
end

puts "Сколько у вас рублей?"
input_rubles = gets.to_f.round(2)
puts "Сколько у вас долларов?"
input_dollars = gets.to_f.round(2)

result = Balance.balance(dollar_rate, input_rubles, input_dollars)
puts result
