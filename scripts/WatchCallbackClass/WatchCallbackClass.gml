function 
	WatchCallbackClass(_time, _callback, _loop = true, _spd = 1) : 
	WatchAlarmClass(_time, _loop, _spd) constructor {
	
	callback = _callback;
	
	step = function(){
		amount_time -= speed;
		if(amount_time < 0){
			reset();
			if(!loop) kill();
			
			return callback();
		}
	}
	static set_callback = function(_new_callback){callback = _new_callback; }

}