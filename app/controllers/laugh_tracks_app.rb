class LaughTracksApp < Sinatra::Base
    get '/' do 
        erb :index 
    end
    
    get '/comedians' do
        erb :comedians
    end
end
