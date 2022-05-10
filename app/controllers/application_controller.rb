class ApplicationController < ActionController::Base
  helper_method :current_pot

  def current_pot
    if session[:finder_id]
      Finder.find(session[:finder_id])
    else
      Finder.new
    end
  end

  def current_pot_or_create
    cp = current_pot
    if cp.new_record?
      cp.save
      session[:finder_id] = cp.id
    end
    cp
  end
end
