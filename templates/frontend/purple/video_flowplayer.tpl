<script type='text/javascript' src="{$relative}/js/swfobject.js"></script>
{literal}
<script type='text/javascript'>
    var s1 = new SWFObject('{/literal}{$relative}{literal}/media/player/FlowPlayerDark.swf','player','630','500','9', '#000', true);
    s1.addParam('allowfullscreen','true');
    s1.addParam('allowscriptaccess','always');
    s1.addVariable("config", "{autoPlay: true, initialScale: 'scale', videoFile: '{/literal}{$baseurl}{literal}/media/videos/flv/{/literal}{$video.VID}{literal}.flv'}");
    s1.write('player');
</script>
{/literal}
