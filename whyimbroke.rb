require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.thisiswhyimbroke.com/new/"))

toys = page.css('#posts .post')

File.open('toys.html', 'w') do |f|

  f.puts("<html>")
  f.puts("<head>")
  f.puts("<meta charset='UTF-8'>")
  f.puts("<title>This Is Why I'm Broke</title>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("<h1> New Items from ThisisWhyImBroke.com </h1>")
  f.puts("<ul>")

toys.each do |cola|
  title = cola.css('h1.title')
  desc = cola.css('div.details div.desc p')
  price = cola.css('div.details div.price')
  f.write("     <li>" + title.text + "</li>") 
  f.write(price.text) 
  f.write(desc)
  
end

f.puts ("</ul>")
f.puts ("</body>")
f.puts ("</html>")

end
