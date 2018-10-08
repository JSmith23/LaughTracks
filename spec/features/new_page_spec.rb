RSpec.describe "User Story 8/Comedians" do
  context 'A visitor' do
    describe 'Visits /comedians/new' do
      it 'should see a form' do
        visit '/comedians/new'
        expect(page).to have_button("Submit")
        expect(page).to have_field("name")
        expect(page).to have_field("age")
        expect(page).to have_field("city")
      end

      it 'should have new comedian in database' do
        visit 'comedians/new'
        fill_in("name", with: "Baba Heru")
        fill_in("age", with: "77")
        fill_in("city", with: "Brooklyn")
        find_button("Submit").click

        expect(page).to have_current_path('/comedians')
        expect(page).to have_content("Baba Heru")
        expect(page).to have_content("77")
        expect(page).to have_content("Brooklyn")
      end
    end
  end
end
