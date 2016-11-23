require 'audite'

describe Audite do
  it 'loads and reports on an mp3' do
    player = Audite.new
    player.load(File.dirname(__FILE__)+'/30sec.mp3')
    expect(player.length).to eq(1324800)
    expect(player.length_in_seconds).to eq(30.040816326530614)
  end

  it 'generates an error on a non-existant mp3' do
    player = Audite.new
    expect {player.load('/tmp/file.mp3')}.to raise_error
  end

  context 'when it holds a queue of songs' do

    it 'indicates whether or not there are songs in the queue' do
      player = Audite.new
      player.queue(File.dirname(__FILE__)+'/30sec.mp3')
      expect(player.songs_in_queue?).to be_truthy
    end

    it 'will play given a queue' do
      player = Audite.new
      player.queue(File.dirname(__FILE__)+'/30sec.mp3')
      player.start_stream
      player.forward(29)
    end

    it 'can queue the song multiple times' do
      times = 2

      player = Audite.new

      times.times do
        player.queue(File.dirname(__FILE__)+'/30sec.mp3')
      end

      player.start_stream
      player.forward(29)
    end
  end
end
