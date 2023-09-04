function watch_global_add(_watch_struct){
	ds_list_add(global.__watch_list, weak_ref_create(_watch_struct));
}