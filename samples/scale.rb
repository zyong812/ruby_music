use_synth :piano

key = 60

full_scale = {
  do: key + 0,
  re: key + 2,
  mi: key + 4,
  fa: key + 5,
  so: key + 7,
  la: key + 9,
  xi: key + 11
}
china_scale = full_scale.slice(:do, :re, :mi, :so, :la).values
japan_scale = full_scale.slice(:do, :mi, :fa, :la, :xi).values


def random_melody(scale)
  scale   << nil
  length  = 50
  
  melody = []
  length.times do |index|
    melody[index] = scale.sample
  end
  melody << scale.first
end

# melody = random_melody(china_scale)
melody = random_melody(japan_scale)

puts melody
play_pattern_timed(melody, [0.5])


# 封装版
# live_loop :melody do
#   play japan_scale.sample, release: 1
#   sleep(0.125)
# end


# live_loop :beats do
#   sync :melody
#   sample :bd_haus
#   sleep(1)
# end