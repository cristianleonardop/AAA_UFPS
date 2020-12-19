require "application_system_test_case"

class KnowledgesTest < ApplicationSystemTestCase
  setup do
    @knowledge = knowledges(:one)
  end

  test "visiting the index" do
    visit knowledges_url
    assert_selector "h1", text: "Knowledges"
  end

  test "creating a Knowledge" do
    visit knowledges_url
    click_on "New Knowledge"

    click_on "Create Knowledge"

    assert_text "Knowledge was successfully created"
    click_on "Back"
  end

  test "updating a Knowledge" do
    visit knowledges_url
    click_on "Edit", match: :first

    click_on "Update Knowledge"

    assert_text "Knowledge was successfully updated"
    click_on "Back"
  end

  test "destroying a Knowledge" do
    visit knowledges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Knowledge was successfully destroyed"
  end
end
