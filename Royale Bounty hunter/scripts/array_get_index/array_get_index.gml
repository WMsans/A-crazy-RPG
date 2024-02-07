///@param array
///@param value
function array_get_index(array, value){
	var len = array_length(array);
	for(var i =0; i < len; i++){
		if(array[i] == value) return i;
	}
	return -1;
}