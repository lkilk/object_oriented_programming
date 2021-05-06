# reorganise secret_diary.rb from one class into classes with high cohesion.
class SecretDiary
  attr_reader :entries
  attr_reader :lock_status

  def initialize
    @lock_status = Lock.new
    @entries = []
  end

  def lock_diary
    @lock_status.lock
  end

  def unlock_diary
    @lock_status.unlock
  end

  def add_entry(entry)
    fail "diary is locked" if lock_status.locked == true

    @entries.push(entry)
  end

  def get_entries
    fail "diary is locked" if lock_status.locked == true

    return @entries
  end
end

class Lock
  attr_reader :locked

  def initialize
    @locked = true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end
