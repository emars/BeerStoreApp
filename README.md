#The Beer Store App (Pending good name)

[![http://www.gtools.club/plusone/569bcae71ba8eb110044e383](http://www.gtools.club/plusone/569bcae71ba8eb110044e383)](http://www.gtools.club/plusone/569bcae71ba8eb110044e383/vote)

[![+1 counter](http://127.0.0.1:3030/plusone/569ad70c15cf268220634143)](http://127.0.0.1:3030/plusone/569ad70c15cf268220634143/vote)


######NOTE: This app is still very much a work in progress

###About
The Beer Store in Ontario, Canada sells hundreds of different
beers in varying container sizes.

Very often, there will be a pricing on a certain size of beer that allows that beer
to be purchased cheaper.

I found myself trying to work this out in my head every time I went to the store,
so I thought that an app that does it for me would be worth my while.

This app queries thebeerstore.ca for all beers and their respective pricing and stores
them in a database.
###Install
```
git clone https://github.com/emars/BeerStoreApp.git
cd BeerStoreApp
bundle install
rake db:migrate
rake db:seed
rails s
```
Note that seeding takes a couple minutes as it must query thebeerstore.ca for all pricing.

Now Point your browser to http://localhost:3000 and you should see the home page
sorting the top 5 and bottom 5 beers.


This line is to keep my github commit streak goin
