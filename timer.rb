require 'notify-send'

p_time = 0
b_time =
sessions = 0

loop do
  puts "How many minutes per session?"
  p_time = (gets.chomp.to_i * 60)
  if p_time >= 300
    break
  else
    puts "Can't be less than five minutes"
    puts " "
  end
end

loop do
  puts "How many minutes per break?"
  b_time = (gets.chomp.to_i * 60)
  if b_time >= 60
    break
  else
    puts "Can't be less than one minute"
    puts " "
  end
end

loop do
  puts "How many sessions?"
  sessions = gets.chomp.to_i
  if sessions >= 1
    break
  else
    puts "At least one session is required to run the Pomodoro."
    puts " "
  end
end

def settings(pt, bt, cycs)
  i = 0
  while i < cycs do
    NotifySend.send({summary: "Productive Time started", icon: "info"})
    sleep(pt - 300)
    NotifySend.send({summary: "Break Time will start in five minutes", icon: "info"})
    sleep(300)
    NotifySend.send({summary: "Break Time started", icon: "info"})
    sleep(bt - 60)
    if (i + 1) == cycs
      NotifySend.send({summary: "Timer will stop in one minute", icon: "info"})
      sleep(60)
    else
      NotifySend.send({summary: "Productive Time will start in one minute", icon: "info"})
      sleep(60)
    end
    i += 1
  end
  NotifySend.send({summary: "Timer stopped after #{cycs} sessions", icon: "info"})
end

puts "Pomodoro running..."
settings(p_time, b_time, sessions)
