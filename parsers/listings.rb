nokogiri = Nokogiri.HTML(content)

products = nokogiri.css('div.product-list')
products.each do |product|
  a_element = product.at_css('a.product__brand')
  if a_element
    url = URI.join('https://www.sociolla.com', a_element['href']).to_s
    if url =~ /\Ahttps?:\/\//i
      pages << {
          url: url,
          page_type: 'products',
          fetch_type: 'browser',
          force_fetch: true,
          vars: {
            category: page['vars']['category'],
            url: url
          }
        }
    end
  end
end