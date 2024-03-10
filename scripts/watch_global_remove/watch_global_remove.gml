/// @desc Remove a watch from global scope
function watch_global_remove(_watch_struct){
	var _ind = ds_list_find_index(global.__watch_list, _watch_struct);
	if(_ind >= 0) ds_list_delete(global.__watch_list, _ind);
}