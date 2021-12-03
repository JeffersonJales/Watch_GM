/// @description ACTIVE CLOCKS

if(my_clock_bool.clock_step()){
	show_debug_message("STEP CLOCK CHANGE MAX TIME");
	my_clock_bool.clock_change_time(my_clock_bool.__max_time + 10);
}

if(my_clock_bool_kill.clock_step()){
	my_clock_bool.clock_kill();
	show_debug_message("KILLING A CLOCK");
}

my_clock_callback.clock_step_cb();

if(my_clock_with_diff_speed.clock_step())
	show_debug_message("WORKS ONLY ONE TIME, BUT FASTER");
