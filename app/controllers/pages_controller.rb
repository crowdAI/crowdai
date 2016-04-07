class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_filter :authenticate_participant!
end
