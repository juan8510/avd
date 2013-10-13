{if $video.embed_code != ''}
{$video.embed_code}
{else}
<script type="text/javascript" src="{$baseurl}/media/player/js/swfobject.js"></script>
<div id="flash"></div>
<script type="text/javascript">
// <![CDATA[
var so = new SWFObject("{$baseurl}/media/player/player.swf?f={$baseurl}/media/player/config.php?vkey={$video.VID}", "main", "{$player_width}", "{$autoheight}", "9", "#000000");
so.addParam('allowfullscreen','true');
so.addParam('wmode','transparent');
so.write("flash");
// ]]>
</script>
{/if}

