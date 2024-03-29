require "rest-client"

def pull_dataset
  front_page = RestClient.get("https://hn.algolia.com/api/v1/search?tags=front_page&hitsPerPage=30")
  front_page_array = JSON.parse(front_page)["hits"]
  front_page_array.each do |i|
    item = RestClient.get("https://hn.algolia.com/api/v1/items/#{i["objectID"]}")
    item_array = JSON.parse(item)
    process_item(item_array)
  end
end

def process_item(item)
  author = User.find_by(username: item["author"])
  unless author.present?
    u = RestClient.get("https://hn.algolia.com/api/v1/users/#{item["author"]}")
    u_array = JSON.parse(u)
    author = add_user(u_array)
  end

  case item["type"]
  when "stories" then add_story(item, author)
  when "comments" then add_comment(item, author)
  else
    puts "Skipping unsupported Item type"
  end

  unless item["children"] == nil
    item["children"].each do |c|
      process_item(c)
    end
  end
end

def add_user(user)
  u = User.create!(
    username: user["username"],
    about: user["about"] || "",
    created_at: item["created_at"],
    updated_at: item["created_at"]
  )

  puts u.inspect
  u
end

def add_story(item, author)
  s = Story.new(
    id: item["id"],
    user: author,
    title: item["title"],
    body: item["text"],
    dead: item["dead"] || false,
    deleted: item["deleted"] || false,
    created_at: item["created_at"],
    updated_at: item["created_at"]
  )
  if item["url"]
    unless Url.exists?(url: item["url"])
      s.url = Url.create(
        url: item["url"],
        created_at: item["created_at"],
        updated_at: item["created_at"]
      )
    end
  end

  s.save!
  puts s.inspect
  s
end

def add_comment(item, author)
  c = Comment.create!(
    id: item["id"],
    parent_item: Story.find_by(id: item["parent_id"]) || Comment.find_by(id: item["parent_id"]),
    user: author,
    body: item["text"],
    dead: item["dead"] || false,
    deleted: item["deleted"] || false,
    created_at: item["created_at"],
    updated_at: item["created_at"]
  )

  puts c.inspect
  c
end

def generate_votes
  User.all.each do |u|
    Item.all.each do |i|
      odds = 1
      if i.voters.count >= 1
        odds = 2
      elsif i.voters.count >= 2
        odds = 5
      end

      if rand * 100 < odds
        vote = 1
        if rand * 100 > 80
          vote = -1
        end

        v = u.votes.create!(
          item: i,
          vote: vote
        )
        puts v.inspect
      end
    end
  end
end

pull_dataset
generate_votes
