require 'nokogiri'
require 'open-uri'

puts 'URLを入力:'
url = gets.chomp!

urls = []
loop do
  doc = Nokogiri::HTML(open(url),nil,"utf-8")

  urls << doc.xpath("//h3[@class='slcHead cFix']/a/@href")


  unless doc.xpath("//a[@class='iS arrowPagingR']").empty?
    url = doc.xpath("//a[@class='iS arrowPagingR']/@href").text    
  else
    break
  end
end

f = File.open("urls.rb","w")
f.print("$urls = %w(\n")
f.puts urls
f.print(")\n")
