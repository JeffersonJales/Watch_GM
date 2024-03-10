/// @desc Remove all watches from the global scope
function watch_global_clear(){
	ds_list_clear(global.__watch_list);
}