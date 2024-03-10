///@desc Creates a new watch that will trigger a callback when it finishes. Use its step function!
///@param {Real}		_time		The time, in frames, to return trigger a callback
///@param {Function}	_callback	The callback will be triggered on the watch finishes
///@param {Bool}		_loop		When completed, case looping, it will restart the watch, case not, it will kill itself
///@param {Real}		_spd		The Watch speed. How much it will decrement watch time per step call
///@return {Struct.WatchCallbackClass}
function 
	WatchCallbackClass(_time, _callback, _loop = true, _spd = 1) : 
	WatchAlarmClass(_time, _loop, _spd) constructor {
	
	callback = _callback;	// The callback will be triggered on the watch finishes
	
	/// @desc It will descrease the timer based on its speed. When the watch finished it will trigger the callback
	/// @returns {Any, Undefined}
	static step = function(){
		amount_time -= speed;
		if(amount_time < 0){
			reset();
			if(!loop) kill();
			
			return callback();
		}
	}
	
	/// Getters / Setters | Please, change if you need it!
	static set_callback = function(_new_callback){ callback = _new_callback; }
}