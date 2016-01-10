module ApplicationHelper

  def error(object)
    render(:partial => 'addition/errors', :locals => {:object => object})
  end

end
