class ContainersController < ApplicationController
  load_and_authorize_resource :container
  def index
    @containers = Container.order(:position)
  end
end
