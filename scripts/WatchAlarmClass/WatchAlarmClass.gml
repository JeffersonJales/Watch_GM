function WatchAlarmClass(_time, _loop = true, _spd = 1) constructor{
	amount_time = _time;
	amount_time_max = _time;
	loop = _loop;
	
	speed = _spd;
	speed_pause = _spd;
	status = WATCH_STATUS_ALIVE;
	
	
	step = function(){
		amount_time -= speed;
		if(amount_time < 0){
			reset();
			if(!loop) kill();
			
			return true;
		}
				
		return false;
	}
	
	pause = function(){ 
		speed_pause = speed; 
		speed = 0; 
		status = WATCH_STATUS_PAUSE; 
	}
	
	resume = function(){ 
		speed = speed_pause; 
		status = WATCH_STATUS_ALIVE; 
	}
	
	static kill = function(){ 
		step = function(){ return false }; 
		status = WATCH_STATUS_DEAD; 
		pause = 0;
		resume = 0;
	}

	
	static reset = function(){ amount_time = amount_time_max;}
	static set_loop = function(_loop){ loop = _loop; }
	static set_speed = function(_spd = 1){ speed = _spd; speed_pause = _spd; }
	
	static set_amount_time = function(_time = 0, _reset = true){ 
		amount_time = _time; 
		if(_reset) reset();
	}
	
	static get_time = function(){ return amount_time;}
	static get_status = function(){ return status; }
	static get_percentage = function(){ return amount_time / amount_time_max;}
}