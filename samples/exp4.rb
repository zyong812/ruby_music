## 实验四：和声

# http://sonic-pi.mehackit.org/exercises/en/04-generate-sounds/04-chord-progressions.html

# C大调(一六四五)
chords = [(chord :C, :major), (chord :A3, :minor), (chord :F, :major), (chord :G, :major)].ring

# C小调(一六四五)
chords = [(chord :C, :minor), (chord :A3, :major), (chord :F, :minor), (chord :G, :minor)].ring

c = chords[0]
live_loop :melody do
  use_synth :blade
  r = [0.25, 0.25, 0.5, 1].__orig_sample__
  play c.to_a.__orig_sample__, attack: 0, release: r
  sleep r
end

live_loop :keys do
  use_synth :blade
  play c
  sleep 1
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  3.times do
    play c[0] # play the first note of the chord
    sleep 1
  end
  play c[2] # play the third note of the chord
  sleep 0.5
  play c[1] # # play the second note of the chord
  sleep 0.5
  c = chords.tick
end
