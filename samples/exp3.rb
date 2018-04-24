## 实验二：音阶


## 中日五声音阶 PK
use_synth :piano

key = :C
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

melody = random_melody(full_scale.values)
# melody = random_melody(china_scale)
# melody = random_melody(japan_scale)

puts melody
play_pattern_timed(melody, [0.5])
