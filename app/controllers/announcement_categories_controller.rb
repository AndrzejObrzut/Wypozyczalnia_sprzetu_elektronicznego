class AnnouncementCategoriesController < ApplicationController

  def index
    @categories = AnnouncementCategory.all
  end

  def new
    @category = AnnouncementCategory.new({:name => "Nowa"})
  end

  def create
    @categories = AnnouncementCategory.new(categories_parameters)
    if @categories.save
      redirect_to(:action=>'index')
    else
      # @counter = AnnouncementCategory.count + 1
      render('new')
    end
  end

  def edit
  end

  # Obsługa usuwania kategorii
  def delete
    @category = AnnouncementCategory.find(params[:id])
  end

  def drop
    category = AnnouncementCategory.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def categories_parameters
    params.require(:category).permit(:name)
  end

end
