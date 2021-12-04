/// By @jalesjefferson
/// source code https://github.com/JeffersonJales/Clock_GMS2

/// Clock that returns a boolean
function Clock (time, loop = true, clock_speed = 1) constructor {
	__time = time;
	__max_time = time;
	__loop = loop;
	
	__clock_speed = clock_speed;
	__clock_speed_pause = clock_speed;

	static clock_step = function(){
		__time -= __clock_speed;
		
		if(__time < 0){
			if(!__loop) clock_kill(); // You can change it to clock_pause too
			clock_reset();
			return true;	
		}
		
		return false;
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
	}
}

/// Clock with callback
function ClockCB(time, callback, loop = true, clock_speed = 1) : Clock(time, loop, clock_speed) constructor {
	__clock_callback = callback;

	static clock_step = function(){
		__time -= __clock_speed;
		if(__time < 0){
			if(!__loop) clock_kill();
			clock_reset();
			__clock_callback();
		}
	}
	
}

function do_nothing() {} 
