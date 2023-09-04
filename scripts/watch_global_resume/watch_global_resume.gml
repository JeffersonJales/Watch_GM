function watch_global_resume(){
	for(var i = 0; i < ds_list_size(global.__watch_list); i++){
		var _ref = global.__watch_list[| i];
		if(weak_ref_alive(_ref)){
			_ref.ref.resume();
		}
		else {
			ds_list_delete(global.__watch_list, i--);
		}
	}
}