function watch_callback(_time, _callback, _loop = true, _spd = 1, _is_global = WATCH_IS_GLOBAL_DEFAULT){
	var _watch = new WatchCallbackClass(_time, _callback, _loop, _spd);
	if(_is_global) ds_list_add(global.__watch_list, weak_ref_create(_watch));

	return _watch;
}