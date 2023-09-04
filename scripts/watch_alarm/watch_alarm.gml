function watch_alarm(_time, _loop = true, _spd = 1, _is_global = WATCH_IS_GLOBAL_DEFAULT){
	var _clock = new WatchAlarmClass(_time, _loop, _spd);
	if(_is_global) ds_list_add(global.__watch_list, weak_ref_create(_clock));

	return _clock;
}