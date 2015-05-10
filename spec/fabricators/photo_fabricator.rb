Fabricator :photo do
  image_uid {
    sequence(:image) { |i|
      [Time.now.year,Time.now.month,Time.now.day,i,'img.png'].join('/')
    }
  }
  image_display_uid {
    sequence(:image) { |i|
      [Time.now.year,Time.now.month,Time.now.day,i,'img.png'].join('/')
    }
  }
end
