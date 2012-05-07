# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://mednadom.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Main page
    add '/', :changefreq => 'weekly'

  # How to buy
    add "/how_to_buy", :changefreq => 'monthly'

  # Store path
    add stores_path, :changefreq => 'weekly'
    Store.shown.each do |store|
      add store_path(store), :lastmod => article.updated_at
    end

  # Examples:
  #
  # Add '/articles'
  #
     add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
     Article.published.each do |article|
       add article_path(article), :lastmod => article.updated_at
     end

  # Questions
    add questions_path

    Question.shown.each do |question|
      add question_path(question)
    end

  #reviews
    add reviews_path
end
