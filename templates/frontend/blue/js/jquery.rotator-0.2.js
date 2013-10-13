var url     = base_url + '/media/videos/tmb/';
var timers  = new Array;
var images  = new Array;
function changeThumb( id, url )
{
        document.getElementById(id).src = url;
}

$(document).ready(function() {
    $("img[id*='rotate_']").mouseover(function(){
        var image_id    = $(this).attr("id");
        var id_split    = image_id.split('_');
        var video_id    = id_split[1];
		var thumbs		= id_split[2];
		if (typeof thumbs == "undefined") {
			thumbs = 20;
		}
		
        for ( var i=1; i<=thumbs; i++ ) {
            var image_url = url + video_id + '/' + i + '.jpg';
            images[i]     = new Image();
            images[i].src = image_url;
        }
        for ( var i=1; i<=thumbs; i++ ) {
            timers[i] = setTimeout("changeThumb('" + image_id + "','" + url + video_id + '/' + i + '.jpg' + "')", i*50*10);
        }
    }).mouseout(function(){
        var image_id    = $(this).attr("id");
        var id_split    = image_id.split('_');
        var video_id    = id_split[1];
		var thumbs		= id_split[2];
		if (typeof thumbs == "undefined") {
			thumbs = 20;
		}

        for ( var i=1; i<=thumbs; i++ ) {
            if ( typeof timers[i] == "number" ) {
                clearTimeout(timers[i]);
            }
        }
        $(this).attr('src', url + video_id + '/1.jpg');
    });
});
