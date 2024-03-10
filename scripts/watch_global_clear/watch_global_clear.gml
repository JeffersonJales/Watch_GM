/// @desc Remove all watches from the global scope
function watch_global_clear(){
	for(var _i = 0; _i < ds_list_size(global.__watch_list); _i++){
		var _ref = global.__watch_list[| _i];
		if(weak_ref_alive(_ref)){
			_ref.ref.is_globally_handled = false;
		}
	}
	
	ds_list_clear(global.__watch_list);
}