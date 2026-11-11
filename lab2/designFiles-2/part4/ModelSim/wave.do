onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -label LEDR -radix hexadecimal /testbench/LEDR
add wave -noupdate -label HEX0 -radix hexadecimal /testbench/HEX0
add wave -noupdate -label HEX1 -radix hexadecimal /testbench/HEX1
add wave -noupdate -label HEX2 -radix hexadecimal /testbench/HEX2
add wave -noupdate -label HEX3 -radix hexadecimal /testbench/HEX3
add wave -noupdate -label HEX4 -radix hexadecimal /testbench/HEX4
add wave -noupdate -label HEX5 -radix hexadecimal /testbench/HEX5
add wave -noupdate -divider part4
add wave -noupdate -label X -radix hexadecimal /testbench/U1/X
add wave -noupdate -label Y -radix hexadecimal /testbench/U1/Y
add wave -noupdate -label Cin -radix binary /testbench/U1/Cin
add wave -noupdate -label M -radix hexadecimal /testbench/U1/M
add wave -noupdate -label B -radix hexadecimal /testbench/U1/B
add wave -noupdate -label z -radix binary /testbench/U1/z
add wave -noupdate -label Cout -radix binary /testbench/U1/Cout
add wave -noupdate -label S1 -radix binary /testbench/U1/S1
add wave -noupdate -label S0 -radix hexadecimal /testbench/U1/S0
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
WaveRestoreZoom {0 ps} {141 ns}
