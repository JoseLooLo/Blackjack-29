transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Decod7seg.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Topo.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/ButtonSync.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Datapath.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/FSM_clock.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Controle.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Led.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/DecodBCD.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Sequencer.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Counter_round.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Counter_time.vhd}
vcom -93 -work work {/home/josef/Documentos/Programacao/git/Blackjack-29/Counter_point.vhd}

