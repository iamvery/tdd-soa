require 'rails_helper'

RSpec.feature 'Cats', type: :feature do
  it 'creates, lists all known cats, and deletes some' do
    visit cats_path

    add_cat(name: 'Garfield', age: 39)

    expect(page).to have_content('Garfield (39)')

    remove_cat

    expect(page).not_to have_content('Garfield')

    add_cat(name: 'Felix', age: 99)
    add_cat(name: 'Sylvester', age: 76)

    expect(page).to have_content('Felix (99)')
    expect(page).to have_content('Sylvester (76)')
  end

  def add_cat(name:, age:)
    click_on 'Add'
    fill_in 'Name', with: name
    fill_in 'Age', with: age
    click_on 'Save Cat'
  end

  def remove_cat
    click_on 'Remove'
  end
end
