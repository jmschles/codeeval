class Group
  attr_reader :gname

  def initialize(gname)
    @gname = gname
  end
end

class Person
  attr_reader :name, :groups, :friends

  def initialize(name)
    @name = name
    @groups = []
    @friends = []
  end

  def add_group(group)
    @groups << group
  end

  def add_friend(person)
    @friends << person
  end
end

group_names = []
friend_hash = {}
File.open(ARGV[0]).each_line do |line|
  person_name, friend_list_str, group_list_str = line.chomp.split(':')
  if group_list_str
    group_names.concat(group_list_str.split(','))
  end
  friend_hash[person_name] = {}
  friend_hash[person_name]['friends'] = friend_list_str.split(',')
  friend_hash[person_name]['groups'] = group_list_str&.split(',') || []
end

groups = []
group_names.uniq.each { |gname| groups << Group.new(gname) }

people = []
friend_hash.keys.each { |name| people << Person.new(name) }

people.each do |person|
  friend_hash[person.name]['friends'].each do |friend_name|
    friend = people.detect { |p| p.name == friend_name }
    person.add_friend(friend)
  end
  friend_hash[person.name]['groups'].each do |group_name|
    group = groups.detect { |g| g.gname == group_name }
    person.add_group(group)
  end
end

people.sort_by { |p| p.name }.each do |person|
  suggested_groups = []
  groups.each do |group|
    next if person.groups.include?(group)
    num_friends = person.friends.count
    num_friends_in_group = person.friends.select { |f| f.groups.include?(group) }.count
    suggested_groups << group if (num_friends_in_group / num_friends.to_f) >= 0.5
  end
  if !suggested_groups.empty?
    puts "#{ person.name }:#{ suggested_groups.sort_by { |g| g.gname }.map(&:gname).join(',') }"
  end
end
