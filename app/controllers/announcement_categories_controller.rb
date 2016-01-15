class AnnouncementCategoriesController < ApplicationController

  before_action :admin_login

  def index
    @categories = AnnouncementCategory.all
  end


  def show
    @category = AnnouncementCategory.find(params[:id])
    send_data @category.image,
              type: @category.mime_type,
              filename: @category.filename,
              disposition: "attachment"
  end

  # Obsługa dodawania nowej kategorii
  def new
    @category = AnnouncementCategory.new
  end

  def create
    @category = AnnouncementCategory.new(category_parameters)
    @category.update_attributes(:filename => @category.image.original_filename)
    @category.update_attributes(:mime_type => @category.image.content_type)
    @category.update_attributes(:image => @category.image.read)
    @category.update_attributes(:size => @category.image.size)

    if @category.save
      redirect_to(:action=>'index')
    else
      flash[:notice] = "Błąd w podawaniu danych"
      render('new')
    end
  end


  def download
    @category = AnnouncementCategory.find params[:id]
    send_data @category.image, filename: @category.filename, type: @category.mime_type, disposition: 'attachment'
  end

  # Obsługa edycji kategorii
  def edit
    @category = AnnouncementCategory.find(params[:id])
  end

  def update
    @category = AnnouncementCategory.find(params[:id])
    if @category.update_attributes(category_parameters)
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

  def category_parameters
    params.require(:category).permit(:name, :image)
  end

end
