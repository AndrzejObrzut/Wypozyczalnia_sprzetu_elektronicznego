class AnnouncementCategoriesController < ApplicationController

  before_action :admin_login

  def index
    @categories = AnnouncementCategory.all
  end

  # Obsługa dodawania nowej kategorii
  def new
    @category = AnnouncementCategory.new({:name => "Nowa"})
  end

  def create
    @categories = AnnouncementCategory.new(categories_parameters)
    if @categories.save
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  # Obsługa edycji kategorii
  def edit
    @category = AnnouncementCategory.find(params[:id])
  end

  def update
    @category = AnnouncementCategory.find(params[:id])
    if @category.update_attributes(categories_parameters)
      redirect_to(:action=>'index')
    else
      render('edit')
    end
  end

  # Obsługa usuwania kategorii
  # WAŻNE! - zrzucać wszystkie ogłoszenia spod kategorii! Coś trzeba z nimi zrobić!
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
