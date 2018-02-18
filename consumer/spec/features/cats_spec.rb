require 'rails_helper'

RSpec.feature 'Cats', type: :feature do
  describe 'index' do
    it 'lists all known cats' do
      visit cats_path

      expect(page).to have_content('Garfield')
      expect(page).to have_content('Felix')
      expect(page).to have_content('Silvester')
    end
  end
end
