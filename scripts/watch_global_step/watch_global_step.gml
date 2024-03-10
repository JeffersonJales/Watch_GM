/// @desc Call step on all global Watches
function watch_global_step(){
	for(var _i = 0; _i < ds_list_size(global.__watch_list); _i++){
		var _ref = global.__watch_list[| _i];
		if(weak_ref_alive(_ref)){
			_ref.ref.step();
		}
		else {
			ds_list_delete(global.__watch_list, _i--);
		}
	}
}