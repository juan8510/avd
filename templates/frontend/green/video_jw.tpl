<script type='text/javascript' src="{$relative_tpl}/js/swfobject.js"></script>
<script type='text/javascript'>
    var s1 = new SWFObject('{$relative}/media/player/player.swf','player','630','500','9');
    s1.addParam('allowfullscreen','true');
    s1.addParam('allowscriptaccess','always');
    s1.addVariable('autostart','true');
    s1.addVariable('bufferlength', '3');
    s1.addVariable('file', '{$baseurl}/media/videos/flv/{$video.VID}.flv');
    s1.addVariable('streamer', 'lighttpd');
    s1.addVariable('id', 'player');
    s1.addVariable('token', 'K49sS9q0');
    s1.addVariable("stretching", "uniform");
    s1.write('player');
</script>
