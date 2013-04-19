module EntriesHelper
  def current_user_is_creator_of_entry?(entry)
    entry.user == current_user
  end
end
