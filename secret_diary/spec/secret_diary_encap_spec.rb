require 'secret_diary_encap'

describe Lock do

  it "locks the diary" do
    expect(subject.lock).to eq true
  end

  it "unlocks the diary" do
    expect(subject.unlock).to eq false
  end

end

describe SecretDiary do

  it "when the diary is locked, add_entry returns an error" do
    entry = double("entry")
    subject.lock_diary
    expect { subject.add_entry(entry) }.to raise_error "diary is locked"
  end

  it "when the diary is locked, get_entries returns an error" do
    subject.lock_diary
    expect { subject.get_entries }.to raise_error "diary is locked"
  end

  it "when the diary is unlocked, we can add a dairy entry" do
    entry = double("entry")
    subject.unlock_diary
    subject.add_entry(entry)
    expect(subject.entries).to include (entry)
  end

  it "when the diary is unlocked, we can view diary entries" do
    entry = double("entry")
    subject.unlock_diary
    subject.add_entry(entry)
    expect(subject.get_entries).to eq([entry])
  end


end
