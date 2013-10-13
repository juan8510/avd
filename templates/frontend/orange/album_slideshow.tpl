<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}
    </div>
    <div class="right span-650">
		<script type="text/javascript" src="{$relative_tpl}/js/jquery.slider-1.5.2.min.js"></script>
		<script type="text/javascript" src="{$relative_tpl}/js/jquery.photoslider-1.1.js"></script>
        {literal}<script type="text/javascript">
        $(document).ready(function(){
            $('#slideshow_speed').slider({ min: 1000, max: 4000, steps: 10, startValue: 2500 });
            $("#start_slideshow").click(function(){
                var duration = $('#slideshow_speed').slider('value');
                FOTO.Slider.duration = duration;
                FOTO.Slider.play('slideshow');
                $('#start_slideshow').addClass('slideshow_disabled');
                $('#stop_slideshow').removeClass('slideshow_disabled')
            });
            $('#stop_slideshow').click(function(){                
                FOTO.Slider.stop('slideshow');
                $('#stop_slideshow').addClass('slideshow_disabled');
                $('#start_slideshow').removeClass('slideshow_disabled')
            });
            {/literal}{$ids}{literal}
            FOTO.Slider.importBucketFromIds('slideshow', ids);
            FOTO.Slider.reload('slideshow');
            FOTO.Slider.preloadImages('slideshow');
            FOTO.Slider.enableSlideshow('slideshow');
            FOTO.Slider.play('slideshow');  
        });
        </script>{/literal}
        <div class="box">            
            <div class="btitle"><h2>{$album.name|upper} {t c='album.SLIDESHOW'}</h2></div>
            {if !$is_friend}
            <div class="private">{t c='album.private' url=$relative u=$username un=$username}.</div>
            {else}
            <div class="blink">
                <div class="blinkl" style="width: 300px;">
                    <div class="blinkl" style="width: 50px;">
                        <div id="start_slideshow" class="photoslider_play"></div>
                        <div id="stop_slideshow" class="photoslider_stop"></div>
                        <div class="clear"></div>
                    </div>
                    <div class="blinkr" style="width: 240px;">
                        <div id="slideshow_speed" class="ui-slider-2">
                            <div class='ui-slider-handle'></div>  
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="blinkr">
                      <a href="{$relative}/album/{$album.AID}/{$album.name|clean}">{t c='album.back_to'} '{$album.name|escape:'html'}'</a>
                      {if isset($smarty.session.uid) && $smarty.session.uid == $album.UID}
                      <strong>&middot;</strong>
                      <a href="{$relative}/album/edit/{$album.AID}">{t c='global.edit'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/addphotos/{$album.AID}">{t c='album.add_more_photos'}</a> <strong>&middot;</strong>
                      <a href="{$relative}/album/delete/{$album.AID}">{t c='global.delete'}</a>
                      {/if}
                </div>
                <div class="clear"></div>
            </div>
            <br />
            <div class="photoslider" id="slideshow"></div>
            {/if}
        </div>
    </div>
    <div class="clear"></div>
</div>
