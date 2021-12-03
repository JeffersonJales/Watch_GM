/// By @jalesjefferson
/// source code in 
function Clock (time, loop = true, callback = do_nothing, clock_speed = 1) constructor {
	__time = time;
	__max_time = time;
	__loop = loop;
	
	__clock_speed = clock_speed;
	__clock_speed_pause = clock_speed;
	
	__clock_callback = callback;

	static clock_step = function(){
		__time -= __clock_speed;
		
		if(__time < 0){
			if(!__loop) clock_pause();
			clock_reset();
			return true;	
		}
		
		return false;
	}
	
	static clock_step_cb = function(){
		__time -= __clock_speed;
		if(__time < 0){
			if(!__loop) clock_pause();
			clock_reset();
			__clock_callback();
		}
	}
	
	static clock_reset = function(){
		__time = __max_time;
	}
	
	static clock_change_time = function(new_time, reset_clock = true){
		__max_time = new_time;
		if(reset_clock) clock_reset();
	}
	
	static clock_change_speed = function(new_speed){
		__clock_speed = new_speed;
	}
	
	static clock_pause = function(){
		__clock_speed_pause = __clock_speed;
		__clock_speed = 0;	
	}
	
	static clock_resume = function(){
		__clock_speed = __clock_speed_pause;
	}
		
	static clock_kill = function(){
		clock_step = do_nothing;
		clock_step_cb = do_nothing;
	}
}

function do_nothing() {} 