#!/opt/homebrew/opt/ruby/bin/ruby

# $stderr.puts ENV['PATH'] # /usr/bin:/bin:/usr/sbin:/sbin

UNOSYP = ARGV[0]

$stderr.puts "Loading #{UNOSYP}"

# Same as UNO Synth Pro Editor / Load – changes synth settings without overriding preset and sequence
syx =
  [0xf0,0,0x21,0x1a,2,3,0x36,0,0x60].concat(
    File.read(UNOSYP).each_byte.to_a[4..0x128]
  ).append(0xf7)

#SYX = UNOSYP + '.syx'
#File.open(SYX, 'w') { |f| f.write syx.pack('C*') }

# Depends on https://github.com/gbevin/SendMIDI
syx_hex = syx[1...-1].map { |e| e.to_s(16) }.join(' ')
cmd = %(/opt/homebrew/bin/sendmidi dev 'UNO Synth Pro' hex syx #{syx_hex})
$stderr.puts cmd
system cmd