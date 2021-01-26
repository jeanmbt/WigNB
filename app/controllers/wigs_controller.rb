class WigsController < ApplicationController
  def home
    @wigs = Wigs.all
  end
end
