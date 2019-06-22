class MostDangerousDayController < ApplicationController
  def index
    @facade = MostDangerousDayFacade.new(params)
  end
end
