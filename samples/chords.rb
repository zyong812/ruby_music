# http://sonic-pi.mehackit.org/exercises/en/04-generate-sounds/04-chord-progressions.html

# 大调
# chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring

# 小调
chords = [(chord :C, :minor), (chord :A, :major), (chord :F, :minor), (chord :G, :minor)].ring
# chords = [(chord :C, :major7), (chord :G, :major7), (chord :A, :minor), (chord :E, :minor),
#           (chord :F, :major7), (chord :G, :major7), (chord :C, :major7), (chord :C, :major7)].ring

c = chords[0] # take the first chord of the ring and save it to a variable
# this is going to be used in all the live_loops. It will be ticked by the :bass loop

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
