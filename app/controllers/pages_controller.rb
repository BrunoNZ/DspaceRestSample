class PagesController < ApplicationController
  before_action :set_site_hierarchy, only: [:welcome]

  def welcome
  end

  def about
  end

  def contact
  end

  private

  def set_site_hierarchy
    @site_hierarchy = DspaceService.client.hierarchy.all
  end
end
