/// @description CREATE CLOCKS
my_clock_bool = new Clock(30);
my_clock_bool_kill = new Clock(60);

cb = function(){
	show_debug_message("CALLBACK CALLED");	
}

my_clock_callback = new Clock(30, 1, cb, 1);
my_clock_with_diff_speed = new Clock(100, 0, do_nothing, 2); 
