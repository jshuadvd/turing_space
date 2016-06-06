require 'rails_helper'

RSpec.describe "Guest visits Turing Space" do
  scenario "they see the root page" do
    VCR.use_cassette "root_page" do
      visit "/"
      expect(page).to have_content("Login")
      expect(page).to have_content("Home")
      expect(page).to have_content("picture of the day")
      expect(page).to have_content("Want to know more about space?")
      expect(page).to have_content("Login to discover...")
      expect(page).to have_content("Pictures taken from Spirit, Opportunity, and Curiousity!")
      expect(page).to have_content("Who is in the ISS (International Space Station)!")
      expect(page).to have_content("Current location of the ISS and more!")
      expect(page).to have_xpath "//img[@src=\'http://apod.nasa.gov/apod/image/1606/UGC9391_hubble_2800_plain.jpg\']"
    end
  end
end
