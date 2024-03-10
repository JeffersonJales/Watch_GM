/// @desc Creates a new WatchAlarmClass
///@param {Real}	_time			The time, in frames, the watch will return true on its step function
///@param {Bool}	_loop			When completed, case looping, it will restart the watch, case not, it will kill itself
///@param {Real}	_spd			The Watch speed. How much it will decrement watch time per step call
///@param {Bool}	_is_global		Is this Watch can be globally handled ?
/// @return {Struct.WatchAlarmClass} 
function watch_alarm(_time, _loop = true, _spd = 1, _is_global = WATCH_IS_GLOBAL_DEFAULT){
	var _watch = new WatchAlarmClass(_time, _loop, _spd);
	if(_is_global) ds_list_add(global.__watch_list, weak_ref_create(_watch));

	return _watch;
}