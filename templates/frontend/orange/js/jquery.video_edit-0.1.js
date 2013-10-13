$(document).ready(function(){
    $("img[id*='select_tmb_']").click(function(event) {
        event.preventDefault();
        var click_id    = $(this).attr('id');
        var id_split    = click_id.split('_');
		var vid			= id_split[2];
        var thumb       = id_split[3];
        for( var i=1; i<=20; i++ ) {
            if ( i == thumb ) {
                $(this).css('border-color', '#ff4800');
            } else {
				$("img[id='select_tmb_" + vid + "_" + i + "']").css('border-color', '#ccc');
            }
        }
		$("input[id='thumb']").val(thumb);
    });
});
