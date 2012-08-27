class AuthorsController < ApplicationController

  add_breadcrumb Proc.new{|c| c.t("authors.index.title")}, :authors_path

  def index
    @authors = User.authors
  end

end
