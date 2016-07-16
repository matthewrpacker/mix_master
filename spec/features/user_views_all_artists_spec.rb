require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page with all artists" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist1 = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path

    expect(page).to have_content artist_name
    expect(page).to have_link artist1.name, href: artist_path(artist1)
  end
end
