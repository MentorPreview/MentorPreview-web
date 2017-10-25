require 'json'

Camp.destroy_all
Course.destroy_all
Mentor.destroy_all
Campus.destroy_all
Album.destroy_all

courseTypes = CourseType.create([
    {name: "school"},
    {name: "app"},
    {name: "web"},
    {name: "game"},
    {name: "coding"},
    {name: "creative"},
    {name: "design"},
])
    
mentors = Mentor.create([
    {name: "バッハ", img_url: "./assets/images/mentors/bach.jpg"},
    {name: "ちゃーはん", img_url: "./assets/images/mentors/cha-han.jpg"},
    {name: "デイジー", img_url: "./assets/images/mentors/daisy.jpg"},
    {name: "デップ", img_url: "./assets/images/mentors/deppu.jpg"},
    {name: "えんほう", img_url: "./assets/images/mentors/enhou.jpg"},
    {name: "ふなみん", img_url: "./assets/images/mentors/funamin.jpg"},
    {name: "ゴディバ", img_url: "./assets/images/mentors/godiva.jpg"},
    {name: "いちげん", img_url: "./assets/images/mentors/ichigen.jpg"},
    {name: "いわのこ", img_url: "./assets/images/mentors/iwanoko.jpg"},
    {name: "かおる", img_url: "./assets/images/mentors/kaoru.jpg"},
    {name: "けんちゃん", img_url: "./assets/images/mentors/kenchan.jpg"},
    {name: "kenty", img_url: "./assets/images/mentors/kenty.jpg"},
    {name: "こばとん", img_url: "./assets/images/mentors/kobaton.jpg"},
    {name: "りさてぃん", img_url: "./assets/images/mentors/lisatin.jpg"},
    {name: "まこ", img_url: "./assets/images/mentors/mako.jpg"},
    {name: "もるもる", img_url: "./assets/images/mentors/morumoru.jpg"},
    {name: "ながた", img_url: "./assets/images/mentors/nagata.jpg"},
    {name: "ニーザ", img_url: "./assets/images/mentors/ni-za.jpg"},
    {name: "ノコノコ", img_url: "./assets/images/mentors/nokonoko.jpg"},
    {name: "おっしぃ", img_url: "./assets/images/mentors/ossy.jpg"},
    {name: "さんちゃん", img_url: "./assets/images/mentors/sanchan.jpg"},
    {name: "しゃもじ", img_url: "./assets/images/mentors/syamoji.jpg"},
    {name: "しのきん", img_url: "./assets/images/mentors/shinokin.jpg"},
    {name: "サブウェイ", img_url: "./assets/images/mentors/subway.jpg"},
    {name: "とし", img_url: "./assets/images/mentors/toshi.jpg"},
    {name: "ツーブロ", img_url: "./assets/images/mentors/twoblo.jpg"},
])

File.open('db/json/courses.json') do |file|
  hash = JSON.load(file)
  hash.each do |element|
    Course.create(
        name: element["name"],
        identifier: element["identifier"],
        img_url: element["img_url"]
    )
  end
end
    
File.open('db/json/campus.json') do |file|
  hash = JSON.load(file)
  hash.each do |element|
    Campus.create(
        official_name: element["official_name"],
        common_name: element["common_name"],
        university_name: element["university_name"],
        campus_name: element["campus_name"],
        postal_code: element["postal_code"],
        address: element["address"],
        lat: element["lat"], 
        lng: element["lng"],
        img_url: element["img_url"]
    )
  end
end

camps = Camp.create([
    {
        name:"7工学院大学附属",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-11',
        end_date:'2017-07-13',
    },
    {
        name:"7信州大学",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-15',
        end_date:'2017-07-17',
    },
    {
        name:"東北大学",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-15',
        end_date:'2017-07-17',
    },
    {
        name:"淳心学院（姫路）",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-18',
        end_date:'2017-07-21',
    },
    {
        name:"7東大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-24',
        end_date:'2017-07-28',
    },
    {
        name:"A早稲田",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-30',
        end_date:'2017-08-03',
    },
    {
        name:"A立命館",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-31',
        end_date:'2017-08-02',
    },
    {
        name:"A九大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-31',
        end_date:'2017-08-03',
    },
    {
        name:"A矢上",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-30',
        end_date:'2017-08-02',
    },
    {
        name:"A関大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-31',
        end_date:'2017-08-04',
    },
    {
        name:"B都市大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-06',
        end_date:'2017-08-08',
    },
    {
        name:"BHAL大阪",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-07',
        end_date:'2017-08-10',
    },
    {
        name:"BHAL名古屋",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-07',
        end_date:'2017-08-11',
    },
    {
        name:"B関大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-07',
        end_date:'2017-08-11',
    },
    {
        name:"B成蹊",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-08',
        end_date:'2017-08-11',
    },
    {
        name:"B北大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-08',
        end_date:'2017-08-11',
    },
    {
        name:"B東大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-08',
        end_date:'2017-08-12',
    },
    {
        name:"B都市大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-07-11',
        end_date:'2017-08-13',
    },
    {
        name:"C横国",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-14',
        end_date:'2017-08-17',
    },
    {
        name:"C立命館",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-14',
        end_date:'2017-08-18',
    },
    {
        name:"C成蹊",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-15',
        end_date:'2017-08-17',
    },
    {
        name:"C工学院",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-15',
        end_date:'2017-08-18',
    },
    {
        name:"C立教",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-15',
        end_date:'2017-08-18',
    },
    {
        name:"C電大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-16',
        end_date:'2017-08-19',
    },
    {
        name:"C名古屋",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-17',
        end_date:'2017-08-19',
    },
    {
        name:"CSFC",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-18',
        end_date:'2017-08-21',
    },
    {
        name:"CDSFC",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-18',
        end_date:'2017-08-26',
    },
    {
        name:"D名古屋",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-21',
        end_date:'2017-08-24',
    },
    {
        name:"D関大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-21',
        end_date:'2017-08-25',
    },
    {
        name:"D青山",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-22',
        end_date:'2017-08-25',
    },
    {
        name:"D関大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-22',
        end_date:'2017-08-25',
    },
    {
        name:"DSFC",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-23',
        end_date:'2017-08-26',
    },
    {
        name:"D東大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-21',
        end_date:'2017-08-24',
    },
    {
        name:"E東大",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-28',
        end_date:'2017-08-31',
    },
    {
        name:"Eデジハリ",
        img_url:"/assets/images/camp/summer2017.png",
        start_date:'2017-08-28',
        end_date:'2017-08-31',
    },
    {
        name:"つま恋",
        img_url:"/assets/images/camp/xmas2017.png",
        start_date:'2017-12-24',
        end_date:'2017-12-27',
    },
    {
        name:"B北海道",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-28',
        end_date:'2017-04-01',
    },
    {
        name:"A東大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-20',
        end_date:'2017-03-22',
    },
    {
        name:"A東大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-21',
        end_date:'2017-03-24',
    },
    {
        name:"B東大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-25',
        end_date:'2017-03-27',
    },
    {
        name:"SFC",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-19',
        end_date:'2017-03-23',
    },
    {
        name:"早稲田",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-26',
        end_date:'2017-03-30',
    },
    {
        name:"藝大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-21',
        end_date:'2017-03-24',
    },
    {
        name:"都市大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-20',
        end_date:'2017-03-24',
    },
    {
        name:"都市大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-04-03',
        end_date:'2017-04-05',
    },
    {
        name:"東海大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-20',
        end_date:'2017-03-24',
    },
    {
        name:"東海大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-27',
        end_date:'2017-03-29',
    },
    {
        name:"横国",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-26',
        end_date:'2017-03-29',
    },
    {
        name:"デジハリ",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-27',
        end_date:'2017-03-30',
    },
    {
        name:"筑波",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-04-03',
        end_date:'2017-04-05',
    },
    {
        name:"名大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-25',
        end_date:'2017-03-28',
    },
    {
        name:"名大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-04-02',
        end_date:'2017-04-04',
    },
    {
        name:"神大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-18',
        end_date:'2017-03-20',
    },
    {
        name:"神大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-29',
        end_date:'2017-04-02',
    },
    {
        name:"HAL大阪",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-27',
        end_date:'2017-03-30',
    },
    {
        name:"九大",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-28',
        end_date:'2017-03-31',
    },
    {
        name:"飯塚市",
        img_url:"/assets/images/camp/spring2017.png",
        start_date:'2017-03-18',
        end_date:'2017-03-20',
    },
])

Album.create([
    {url: 'https://photos.app.goo.gl/XIoOCJo4JQvMVw6w2'},
    {url: 'https://photos.app.goo.gl/o9CQli8mWdmnJUup1'}, 
    {url: 'https://photos.app.goo.gl/DMKbx6rWcnpJLVl82'}, 
])