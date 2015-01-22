module ServiceOrdersHelper
  def self.get_events
    [["Move to our new home", "Vietnam trip", "Get our new car"], ["Adam got his dream job", "Eve honored phd", "Attended Brazil Worldcup"]]
  end

  def self.get_family_member(sex)
    case sex
    when "male"
      member_arr = [["Bill Swan", "Father"], ["Christina Lewis", "Mother"], ["Every Swan", "Brother"], ["Lexy wan", "Sister"]]
    else
      member_arr = [["Martin Nos", "Father"], ["Marria Grace", "Mother"], ["Terry Swan", "Brother"], ["Hanna Martin", "Sister"]]
    end
    member_arr.collect{|each| Hash[%w{name appell}.zip(each)]}
  end

  def self.get_favorite
    {
      male_favorite: ["Pasta White Sause", "Twilight Saga", "Blue", "Dogs"],
      female_favorite: ["Pizza Peproni", "Transformers", "Pink", "Cats"],
      common_favorite: [[["Winter & Spring", "cloud"], ["Frank Sinatra", "microphone"], ["Maldive Islands","map-marker"]], [["Your Song - Elton John", "music"], ["Dolce and Gabbana", "recycle"], ["Pride and Prejudice", "book"]]],
      icon: ["paw", "film", "paint-brush", "github-alt"]
    }
  end

  def self.get_time_line_event
    [ ["flash","Our First Kiss",
       "24 May 2010 - By Adam", 
       "It wasn't that long, and it certainly wasn't the kind of kiss you see in movies these days, but it was wonderful in its own way, and all I can remember about the moment is that when our lips touched, I knew the memory would last forever."], 
      ["headphones",
       "Got Engaged",
       "20 Dec 2010 - By Eve",
       "Her boyfriend gives her a Mercedes, [her friends] say, 'Oh, that's nice.' But her boyfriend gives her a diamond, they say, 'Oh, he's serious.' It's not just the gift of love-it's the gift of commitment. She's not jumping up and down because she got a diamond ring but because she got a guy!"],
      ["leaf",
       "Got Married",
       "24 May 2011 - By Adam",
       "Marriage has made me a lot happier and I'm deeply in love with my wife, and I thank God for her every day."], 
      ["child",
       "I'm Pregnant",
       "12 Jan 2012 - By Eve",
       "Of course I can do this. I'm pregnant, not brain-damaged. My condition doesn't change my personality."], 
      ["group",
       "Welcome Michael!",
       "1 Oct 2012 - By Adam",
       "Welcome Our new little family member, he is so cute and we still afraid to hurt him as we really don't have experience with newborn, excuse us Michael!"] ]
  end
end
