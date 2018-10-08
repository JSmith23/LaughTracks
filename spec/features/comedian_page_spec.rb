RSpec.describe "User Story 1/Comedians" do
  context 'A visitor' do
    describe 'Visits /comedians' do
      it 'should see a list of comedians on the page' do
        comic = Comedian.create(name: 'Martin Lawrence', age: 47, city: "Frankfurt")
        visit '/comedians'
        expect(page).to have_content(comic.name)
      end
      it 'should see the information for each comedian (name,age,city)' do
        comic = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        comic = Comedian.create(name: 'Martin Lawrence', age: 47, city: "Frankfurt")
        comic = Comedian.create(name: "Bernie Mac", age: "61", city: "Chicago")
        visit '/comedians'
        expect(page).to have_content(comic.name)
        expect(page).to have_content(comic.age)
        expect(page).to have_content(comic.city)
      end

      it "should see a list of each comedian's TV specials' names" do
        comic_1 = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        comic_2 = Comedian.create(name: "Martin Lawrence", age: "53", city: "Frankfurt")
        comic_3 = Comedian.create(name: "Christopher Tucker", age: "47", city: "Atlanta")

        special_1 = Special.create(comedian_id: 1, name:"The Pimp Chronicles Pt. 1",run_length: 45, image_url: "https://m.media-amazon.com/images/M/MV5BODUwOTgyMjUtMTVkZS00N2IzLWE5ZDQtZjY1MWIxYjVhODE5XkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        special_2 = Special.create(comedian_id: 2, name:"Doin Time: Uncut",run_length: 62, image_url: "https://m.media-amazon.com/images/M/MV5BMzQyMjI2MTItYzdjNi00MWUzLWFkNjItZWI3ZjEwMzdiNDhmXkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        special_3 = Special.create(comedian_id: 3, name:"Chris Tucker Live",run_length: 92, image_url: "https://m.media-amazon.com/images/M/MV5BMTU1MzU2Njg2MF5BMl5BanBnXkFtZTgwNTM0MzgxNjE@._V1_SY1000_CR0,0,674,1000_AL_.jpg")

        visit '/comedians'

        expect(page).to have_content(special_1.name)
        expect(page).to have_content(special_2.name)
        expect(page).to have_content(special_3.name)
      end

      it "should see each special's run time length in minutes" do
        comic_1 = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        comic_2 = Comedian.create(name: "Martin Lawrence", age: "53", city: "Frankfurt")
        comic_3 = Comedian.create(name: "Christopher Tucker", age: "47", city: "Atlanta")

        special_1 = Special.create(comedian_id: 1, name:"The Pimp Chronicles Pt. 1",run_length: 45, image_url: "https://m.media-amazon.com/images/M/MV5BODUwOTgyMjUtMTVkZS00N2IzLWE5ZDQtZjY1MWIxYjVhODE5XkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        special_2 = Special.create(comedian_id: 2, name:"Doin Time: Uncut",run_length: 62, image_url: "https://m.media-amazon.com/images/M/MV5BMzQyMjI2MTItYzdjNi00MWUzLWFkNjItZWI3ZjEwMzdiNDhmXkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        special_3 = Special.create(comedian_id: 3, name:"Chris Tucker Live",run_length: 92, image_url: "https://m.media-amazon.com/images/M/MV5BMTU1MzU2Njg2MF5BMl5BanBnXkFtZTgwNTM0MzgxNjE@._V1_SY1000_CR0,0,674,1000_AL_.jpg")

        visit '/comedians'

        expect(page).to have_content(special_1.run_length)
      end

      it "should see a thumbnail image" do
        comic_1 = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        special_1 = Special.create(comedian_id: 1, name:"The Pimp Chronicles Pt. 1",run_length: 45, image_url: "https://m.media-amazon.com/images/M/MV5BODUwOTgyMjUtMTVkZS00N2IzLWE5ZDQtZjY1MWIxYjVhODE5XkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")

        visit '/comedians'

        expect(page).to have_css("img[src='#{special_1.image_url}']")

      end

      it "should see the list of comedians who match the age criteria" do
        comic_1 = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        special_1 = Special.create(comedian_id: 1, name:"The Pimp Chronicles Pt. 1",run_length: 45, image_url: "https://m.media-amazon.com/images/M/MV5BODUwOTgyMjUtMTVkZS00N2IzLWE5ZDQtZjY1MWIxYjVhODE5XkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")

        comic_2 = Comedian.create(name: "Martin Lawrence", age: "53", city: "Frankfurt")
        special_2 = Special.create(comedian_id: 2, name:"Doin Time: Uncut",run_length: 62, image_url: "https://m.media-amazon.com/images/M/MV5BMzQyMjI2MTItYzdjNi00MWUzLWFkNjItZWI3ZjEwMzdiNDhmXkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")

        comic_3 = Comedian.create(name: "Christopher Tucker", age: "47", city: "Atlanta")
        special_3 = Special.create(comedian_id: 3, name:"Chris Tucker Live",run_length: 92, image_url: "https://m.media-amazon.com/images/M/MV5BMTU1MzU2Njg2MF5BMl5BanBnXkFtZTgwNTM0MzgxNjE@._V1_SY1000_CR0,0,674,1000_AL_.jpg")

        visit "/comedians?age=47"

        expect(page).to have_content(comic_1.name)
        expect(page).to_not have_content(comic_2.name)
        expect(page).to have_content(comic_3.name)
      end

      it 'should see a count of TV specials in statistics area' do
        comic_1 = Comedian.create(name: "Katt Williams", age: "47", city: "Cincinati")
        comic_2 = Comedian.create(name: "Martin Lawrence", age: "53", city: "Frankfurt")
        special_1 = Special.create(comedian_id: 1, name:"The Pimp Chronicles Pt. 1",run_length: 45, image_url: "https://m.media-amazon.com/images/M/MV5BODUwOTgyMjUtMTVkZS00N2IzLWE5ZDQtZjY1MWIxYjVhODE5XkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        special_2 = Special.create(comedian_id: 2, name:"Doin Time: Uncut",run_length: 62, image_url: "https://m.media-amazon.com/images/M/MV5BMzQyMjI2MTItYzdjNi00MWUzLWFkNjItZWI3ZjEwMzdiNDhmXkEyXkFqcGdeQXVyNDUxMTg2MTU@._V1_SY1000_CR0,0,666,1000_AL_.jpg")

        visit '/comedians'

        expect(page).to have_content("Total Specials Count: 2")

      end
    end
  end
end
