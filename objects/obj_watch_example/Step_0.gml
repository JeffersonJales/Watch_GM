/// @description ACTIVE CLOCKS
if(__alarm_1.step()) show_debug_message("Clock Alarm");
if(__alarm_2.step()) show_debug_message("Clock Alarm 2");

__alarm_cb.step()
__alarm_cb_2.step()
__alarm_cb_3.step()

if(__alarm_3.step()){ 
	if(!__is_kill) {
		__is_kill = true;
		watch_global_resume();
		show_debug_message("Global resume");
	}
	else {
		watch_global_kill();
		__alarm_3.kill();
		show_debug_message("GLOBAL KILL");
	}
}