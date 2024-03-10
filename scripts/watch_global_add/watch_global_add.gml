/// @desc Adds a watch to the global scope
/// @param {Struct.WatchAlarmClass} _watch_struct A _watch_struct to add to global scope
function watch_global_add(_watch_struct){
	_watch_struct.is_globally_handled = true;
	ds_list_add(global.__watch_list, weak_ref_create(_watch_struct));
}