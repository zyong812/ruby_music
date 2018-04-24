## Getting started

# 旋律
play 60

# 和声
play 60
play 64
play 67

play chord(:C3, :major)

# 节奏
sleep 1


# 音符参数
play 60
play 60, attack: 1, release: 3

# 音色
use_synth :fm
2.times do
  play 60
  sleep 0.5
  play 67
  sleep 0.5
end

# 音效
with_fx :reverb do
  with_fx :distortion do
    sample :guit_e_fifths
  end
end


# 多音轨
in_thread do
  loop do
    sample :loop_amen
    sleep 1.753
  end
end

in_thread do
  16.times do
    play 75
    sleep 1.753
    play 74
    sleep 0.25
  end
end
