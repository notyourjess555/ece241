onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label SW -radix unsigned /testbench/SW
add wave -noupdate -divider part2
add wave -noupdate -label V -radix hexadecimal /testbench/U1/V
add wave -noupdate -label z -radix binary /testbench/U1/z
add wave -noupdate -label A -radix hexadecimal /testbench/U1/A
add wave -noupdate -label HEX0 -radix hexadecimal /testbench/U1/HEX0
add wave -noupdate -label HEX1 -radix hexadecimal /testbench/U1/HEX1
TreeUpdate [SetDefaultTree]
quietly wave cursor active 1
configure wave -namecolwidth 80
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {131 ns}
