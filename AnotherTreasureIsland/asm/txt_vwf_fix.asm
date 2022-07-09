//Hacky VWF Fixes
//Turning Cross Puzzle Fixes
enqueue pc
seekAddr($9FCC11)
	jsl fix_special_turning_puzzle1; nop
seekAddr($9FCC5F)
	jsl fix_special_turning_puzzle2
dequeue pc

fix_special_turning_puzzle1:
	jsl vwf_mode_fixed_width	//Fixed Width Mode
	//Do what the original code was doing
	ldx $02
	lda $9F7F0E,x
	rtl

fix_special_turning_puzzle2:	//Variable Width Mode for "OK?"
	jsl vwf_mode_variable_width
	//Do what the original code was doing
	clc
	adc.w #$0005
	rtl

//Watering Robot Path Fixes
enqueue pc
seekAddr($9FCB1D)
	jsl fix_waterrobotpath1; nop; nop
dequeue pc

fix_waterrobotpath1:
	jsl vwf_reset
	//Do what the original code was doing
	lda $302A
	and.w #$0010
	rtl
