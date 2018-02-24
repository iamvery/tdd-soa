require 'rails_helper'

RSpec.feature 'Cats', type: :feature do
  it 'creates and lists all known cats' do
    visit cats_path

    add_cat(name: 'Garfield', age: 39)
    add_cat(name: 'Felix', age: 99)
    add_cat(name: 'Sylvester', age: 76)

    expect(page).to have_content('Garfield (39)')
    expect(page).to have_content('Felix (99)')
    expect(page).to have_content('Sylvester (76)')
  end

  def add_cat(name:, age:)
    click_on 'Add'
    fill_in 'Name', with: name
    fill_in 'Age', with: age
    click_on 'Save Cat'
  end
end
