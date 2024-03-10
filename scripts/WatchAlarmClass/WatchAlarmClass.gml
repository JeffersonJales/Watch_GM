///@desc Creates a new watch that returns true when it finishes. Use its step function!
///@param {Real}	_time	The time, in frames, to return true on step()
///@param {Bool}	_loop	When completed, case looping, it will restart the watch, case not, it will kill itself
///@param {Real}	_spd	The Watch speed. How much it will decrement watch time per step call

function WatchAlarmClass(_time, _loop = true, _spd = 1) constructor{
	amount_time = _time;				/// The time, in frames, to return true on step()
	amount_time_max = _time;			/// The max time, in frames, for the watch
	loop = _loop;						/// When completed, the watch will continue to work or not
										
	speed = _spd;						/// The watch speed, the amout time it ticks the watch per frame, default is 1 frame per frame
	speed_pause = _spd;					/// The watch speed before its have been paused	
	status = WATCH_STATUS_ALIVE;		/// The watch status, starts alive
	is_globally_handled = false;		/// Is the watch is globally handled ?
	
	/// @desc It will descrease the timer based on its speed. When the watch finished it will return true
	/// @return {Bool}
	step = function(){
		amount_time -= speed;
		if(amount_time < 0){
			reset();
			if(!loop) kill();
			
			return true;
		}
				
		return false;
	}
	
	/// @desc Pauses the watch. Setting its speed to zero
	pause = function(){ 
		if(status != WATCH_STATUS_ALIVE) return;
		
		speed_pause = speed; 
		speed = 0; 
		status = WATCH_STATUS_PAUSE; 
	}
	
	/// @desc Unpause the watch. It's speeds will return to normal
	resume = function(){ 
		if(status != WATCH_STATUS_PAUSE) return;
		
		speed = speed_pause; 
		status = WATCH_STATUS_ALIVE; 
	}
	
	/// @desc The watch will not work anymore. Now its step function will always return false 
	static kill = function(){ 
		step = function(){ return false }; 
		pause = function(){};
		resume = function(){};
		
		status = WATCH_STATUS_DEAD; 
	}

	/// @desc The watch will be reset the current time
	static reset = function(){ amount_time = amount_time_max;}
	
	/// @desc Get the percentage of watch life
	static get_percentage = function(){ return amount_time / amount_time_max;}

	/// General Getter / Setters | Please, change if you need it
	static is_global = function(){ return is_globally_handled; }
	static get_time = function(){ return amount_time;}
	static get_status = function(){ return status; }

	static set_loop = function(_loop){ loop = _loop; }
	static set_speed = function(_spd = 1){ speed = _spd; speed_pause = _spd; }
	static set_amount_time = function(_time){ 
		amount_time = _time; 
	}
	static set_amount_time_max = function(_time, _reset = true){
		amount_time_max = _time;
		if(reset) reset();
	}
}