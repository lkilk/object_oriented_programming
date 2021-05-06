require 'secret_diary'
# SecretDiary
#   - lock
#   - unlock
#   - add_entry
#   - get_entries
#
# Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.
#
# When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.
#
# When the user locks the diary, by calling `lock`, `add_entry` and `get_entries` should, again, throw an error.



describe SecretDiary do

  it "locks the diary" do
    expect(subject.lock).to eq true
  end

  it "unlocks the diary" do
    expect(subject.unlock).to eq false
  end

  it "when the diary is locked, add_entry returns an error" do
    entry = double("entry")
    subject.lock
    expect { subject.add_entry(entry) }.to raise_error "diary is locked"
  end

  it "when the diary is locked, get_entries returns an error" do
    subject.lock
    expect { subject.get_entries }.to raise_error "diary is locked"
  end

  it "when the diary is unlocked, we can add a dairy entry" do
    entry = double("entry")
    subject.unlock
    subject.add_entry(entry)
    expect(subject.entries).to include (entry)
  end

  it "when the diary is unlocked, we can view diary entries" do
    entry = double("entry")
    subject.unlock
    subject.add_entry(entry)
    expect(subject.get_entries).to eq([entry])
  end


end
