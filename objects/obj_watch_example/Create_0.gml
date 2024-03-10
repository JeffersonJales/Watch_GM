/// @description CREATE WATCHES
__alarm_1 = watch_alarm(10, false);
__alarm_2 = watch_alarm(15);

__alarm_cb = watch_callback(20, function(){
	show_debug_message("Callback Alarm")
},,, true)

__alarm_cb_2 = watch_callback(10, function(){
	show_debug_message("Callback Unique")
}, false, 2);

__alarm_cb_3 = watch_callback(60, function(){
	
	watch_global_pause();
	
	__alarm_3.resume();
	
	var _p = function(_str){ show_debug_message(_str) };
	_p(__alarm_1.get_status());
	_p(__alarm_2.get_status());
	_p(__alarm_cb.get_status());
	_p(__alarm_cb_2.get_status());
	_p(__alarm_cb_3.get_status());
}, false)

__is_kill = false;
__alarm_3 = watch_alarm(60, true, 1, false);
__alarm_3.pause();