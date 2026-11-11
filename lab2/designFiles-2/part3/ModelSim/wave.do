onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label SW -radix hexadecimal /testbench/SW
add wave -noupdate -divider part3
add wave -noupdate -label LEDR -radix hexadecimal /testbench/U1/LEDR
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
WaveRestoreZoom {0 ps} {80 ns}
