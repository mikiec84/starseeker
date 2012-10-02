# Setup stub data for watch events.

raise "'production' should not be sutubed." if Rails.env.production?

WatchEvent.destroy_all

GITHUB_LOGIN = ENV['GITHUB_LOGIN']
unless GITHUB_LOGIN
  raise "The environment variable `\033[31mGITHUB_LOGIN\033[39m` is required."
end

def path_to_watch_event(path)
  data = JSON.parse(File.read(path))
  WatchEvent.new(data.except('id'))
end

fixture_path = Rails.root.join('spec', 'fixtures', 'watch_events')

# Setup watch event from `GITHUB_LOGIN`
data_path = fixture_path.join('*.json').to_s
Dir[data_path].each.with_index do |path, n|
  watch_event = path_to_watch_event(path)

  @user ||= Octokit.user(GITHUB_LOGIN)
  keys = watch_event.actor.keys
  watch_event.actor = @user.to_hash.extract!(*keys)

  watch_event.created_at = n.days.ago.strftime(WatchEvent::DATETIME_FORMAT)
  watch_event.save!
end

# Setup watch event to `GITHUB_LOGIN`
Dir[data_path].each.with_index do |path, n|
  watch_event = path_to_watch_event(path)

  @following ||= Octokit.following(GITHUB_LOGIN)
  watch_event.actor = @following.sample.extract!(*watch_event.actor.keys)
  @repos ||= Octokit.repos(GITHUB_LOGIN)
  repo = @repos.sample
  watch_event.repo['id']   = repo['id']
  watch_event.repo['name'] = repo['full_name']
  watch_event.repo['url']  = repo['url']

  watch_event.created_at = n.hours.ago.strftime(WatchEvent::DATETIME_FORMAT)
  watch_event.save!
end
