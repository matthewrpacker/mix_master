require 'rails_helper'

describe "Edit an Artist" do
  scenario "User can edit an artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(Artist.first)

    click_on "Edit"

    fill_in "artist_name", with: "Matt Packer"
    click_on "Update Artist"

    expect(page).to have_content "Matt Packer"
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
