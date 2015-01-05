class PagesController < PublicController
  skip_before_action :ensure_logged_in
end
