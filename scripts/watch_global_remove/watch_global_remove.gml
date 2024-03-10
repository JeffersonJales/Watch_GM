/// @desc Remove a watch from global scope
/// @param {Struct.WatchAlarmClass} _watch_struct A WatchAlarmClass to remove from global scope
function watch_global_remove(_watch_struct){
	for(var _i = 0; _i < ds_list_size(global.__watch_list); _i++){
		var _ref = global.__watch_list[| _i];
		if(weak_ref_alive(_ref) && _ref.ref == _watch_struct){
			_watch_struct.is_globally_handled = false;
			ds_list_delete(global.__watch_list, _i);
			return;
		}
	}
}