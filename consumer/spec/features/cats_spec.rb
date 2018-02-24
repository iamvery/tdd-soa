require 'rails_helper'

RSpec.feature 'Cats', type: :feature do
  it 'lists all known cats' do
    visit cats_path

    expect(page).to have_content('Garfield (39)')
    expect(page).to have_content('Felix (99)')
    expect(page).to have_content('Sylvester (76)')
  end
end
