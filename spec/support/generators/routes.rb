require 'pp'

#it 'routes to #index' do
#  expect(get: '/challenges/1/submissions').to route_to('submissions#index', challenge_id: '1')
#end

# [" ", "POST", "/admin/submissions(.:format)", "admin/submissions#create"]
# ["new_admin_submission", "GET", "/admin/submissions/new(.:format)", "admin/submissions#new"]
# [" ", "PUT", "/admin/submissions/:id(.:format)", "admin/submissions#update"]



def main(route)
  puts "ROUTE: #{route}"
  all_routes = []
  #os_call = bundle exec rake routes | grep #{route}"
  #puts os_call
  tmp = (`bundle exec rake routes | grep #{route}`).split(/\n/)
  routes = []
  tmp.each do |l|
    elems = l.split(' ')
    elems.unshift(' ') if elems.count == 3
    routes << elems
  end

  routes.each do |r|
    url = r[2].chomp('(.:format)')
    params = url.scan(/:\w+/)              #  => [":challenge_id", ":id"]
    #params.reject! {|e| e == ':id'}

    if ":#{route}_id" == params.first
      next
    end
    all_routes << r[3]
    append_text = nil
    if params.any?
      append_text = ', '
      append_text += params.map {|e| "#{e} => '1'"}.join(',')
    end

    # To replace them with "1"s
    url.gsub!(/:\w+/, '1')         #  => "/challenges/1/submissions/1"
    puts "it 'routes to #{r[3]}' do"
    puts "  expect(#{r[1].downcase}: '#{url}').to route_to('#{r[3]}'#{append_text})"
    puts "end"
    puts "\n"
  end
  puts "\n\n\n"
  all_routes.each do |r|
    puts "'#{r}',"
  end
end

#routes = ['challenge','dataset_file','organizer','post','submission','submission_file','team','timeline','topic']
routes = ['dataset_file']
routes.each {|r| main(r)}
