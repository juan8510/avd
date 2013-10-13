<div id="content">
    <div class="left span-300">
        {include file='user_info.tpl'}        
    </div>
    <div class="right span-650">
        <div class="box">            
            <div class="btitle"><h2>{t c='requests.title'}</h2></div>
            {if $requests}
            <div class="blinkp">
                {t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$requests_total}</span> {t c='requests.friend'}.
            </div>
            {section name=i loop=$requests}
            <div id="request_message_{$requests[i].FID}" class="request_message" style="display: none;"></div>
            <div id="request_{$requests[i].FID}">
            <div class="request">
                <div class="request_left">
                    <a href="{$relative}/user/{$requests[i].username}"><img src="{$relative}/media/users/{if $requests[i].photo != ''}{$requests[i].photo}{else}nopic-{$requests[i].gender}.gif{/if}" alt="{$requests[i].username}'s avatar" /><br />{$requests[i].username}</a>
                </div>
                <div class="request_right">
                    <p>{$requests[i].message|escape:'html'|nl2br}</p>
                    <div class="request_actions">
                        <a href="#accept_friend" id="accept_friend_{$requests[i].FID}">{t c='global.accept'}</a>
                        <a href="#reject_friend" id="reject_friend_{$requests[i].FID}">{t c='global.reject'}</a>
                        <div class="clear_left"></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </div>
            {/section}
            {else}
            <div class="no_items">{t c='requests.none'}</div>
            {/if}
            <br />
        </div>
    </div>
    <div class="clear"></div>
</div>