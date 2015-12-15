class AnnouncementCategoriesController < ApplicationController

  def index
    @categories = AnnouncementCategory.sortASC
  end

  def show
  end

  def new
    @counter = AnnouncementCategory.count + 1
  end

  def create
    @categories = AnnouncementCategory.new(categories_parameters)
    if @categories.save
      redirect_to(:action=>'index')
    else
      @counter = AnnouncementCategory.count + 1
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  def categories_parameters
    params.require(:cetegory).permit(:name, :position, :visible)
  end

end
