nokogiri = Nokogiri.HTML(content)

# initialize an empty hash
product = {}

product['url'] = page['vars']['url']

#save the category
product['category'] = page['vars']['category']

#extract title and brand
product['title'] = nokogiri.at_css('h1.title').text.strip
product['brand'] = nokogiri.at_css('p.brand > a').text.strip

#extract size

#extract price
product['disc'] = nokogiri.at_css('span.save').text.strip.gsub('-','')
product['original_price'] = nokogiri.at_css('span.ori').text.strip
product['disc_price'] = nokogiri.at_css('span.after').text.strip

#extract number of reviews
product['reviews_count']  = nokogiri.at_css('li.total-review').text

#extract rating
product['rating'] = nokogiri.at_css('li.rating').text

#extract product description
product['description']  = nokogiri.at_css('div#product-description > div > p').text


# specify the collection where this record will be stored
product['_collection'] = "products"

# save the product to the job’s outputs
outputs << product