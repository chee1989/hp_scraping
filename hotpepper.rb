require 'nokogiri'
require 'open-uri'
require_relative 'urls.rb'

# NokogiriでURLの情報を取得する
$urls.each do |url|
  doc = Nokogiri::HTML(open(url),nil,"utf-8")
  
  puts doc.xpath("//p[@class='detailTitle']").text
  puts doc.xpath("//th[.='定休日']/../td").text
end
