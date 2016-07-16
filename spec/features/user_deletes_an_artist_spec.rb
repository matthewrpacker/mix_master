require 'rails_helper'

describe "Delete an aritst" do
  scenario "User can delete an artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(Artist.first)

    expect(page).to have_content("Bob Marley")

    click_on "Delete"

    expect(current_path).to eq(artists_path)
    expect(page).to have_no_content("Bob Marley")
  end
end
