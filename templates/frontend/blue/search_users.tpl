<div id="content">
    <div class="left span-755">
        <div class="box">            
            <div class="bmenu">
                <div class="bmenul" style="width: 57%;"><h2>{t c='search.title'} '{$search_query|truncate:30:' ...':true|escape:'html'}'</h2></div>
                <div class="bmenur" style="width: 40%;">{literal}
                    <script type="text/javascript">
                        $(document).ready(function(){
                            $("select[id='order_gender'],select[id='order_interested'],select[id='order_avatar']").change(function() {
                                $('#orderUsers').submit();
                            });
                        });
                    </script>
                    {/literal}
                    <div id="order_form">
                    <form name="orderUsers" id="orderUsers" method="get" action="{$relative}/search">                    
                        <input name="o" type="hidden" value="{$order}" />
                        <input name="search_query" type="hidden" value="{$search_query|escape:'html'}" />
                        <input name="search_type" type="hidden" value="users" />
                        <span class="mleft">{t c='global.gender'}: </span>
                        <select name="g" id="order_gender">
                            <option value=""{if $gender == ''} selected="yes"{/if}>{t c='global.any'}</option>
                            <option value="Male"{if $gender == 'Male'} selected="yes"{/if}>{t c='global.male'}</option>
                            <option value="Female"{if $gender == 'Female'} selected="yes"{/if}>{t c='global.female'}</option>
                        </select>
                        <span class="mleft">{t c='global.interested'}:</span>
                        <select name="i" id="order_interested">
                            <option value=""{if $interest == ''} selected="yes"{/if}>{t c='global.any'}</option>
                            <option value="Guys"{if $interest == 'Guys'} selected="yes"{/if}>{t c='global.guys'}</option>
                            <option value="Girls"{if $interest == 'Girls'} selected="yes"{/if}>{t c='global.girls'}</option>
                            <option value="Guys+Girls"{if $interest == 'Guys + Girls'} selected="yes"{/if}>{t c='global.guys_girls'}</option>
                        </select>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="bsubmenu">
                <div class="bsubmenul">
                    {if $order == 'mr'}{t c='global.most_recent'}{else}<a href="{url base='search' strip='o' value='mr'}">{t c='global.most_recent'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'on'}{t c='global.online_now'}{else}<a href="{url base='search' strip='o' value='on'}">{t c='global.online_now'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'mv'}{t c='global.most_viewed'}{else}<a href="{url base='search' strip='o' value='mv'}">{t c='global.most_viewed'}</a>{/if} <strong>&middot;</strong>
                    {if $order == 'ma'}{t c='global.most_active'}{else}<a href="{$url base='search' strip='o' value='ma'}">{t c='global.most_active'}</a>{/if}
                </div>
                <div class="bsubmenur">
                    <div id="avatar_form">
                        <span class="mleft">{t c='global.avatar'}: </span>
                        <select name="a" id="order_avatar">
                            <option value=""{if $avatar == ''} selected="yes"{/if}>{t c='global.any'}</option>
                            <option value="yes"{if $avatar == 'yes'} selected="yes"{/if}>{t c='global.yes'}</option>
                            <option value="no"{if $avatar == 'no'} selected="yes"{/if}>{t c='global.no'}</option>
                        </select>
                    </div>
                    </form>
                </div>
                <div class="clear"></div>
            </div>
            <div class="blinkp">
                <div class="blinkcl">{t c='global.showing'} <span>{$start_num}</span> {t c='global.to'} <span>{$end_num}</span> {t c='global.of'} <span>{$users_total}</span> {t c='user.users'}.</div>
                <div class="blinkcr"><a href="{$relative}/signup">{t c='user.new'}</a></div>
                <div class="clear"></div>
            </div>
            {section name=i loop=$users}
            <div class="user-box">
                <a href="{$relative}/user/{$users[i].username}"><img src="{$relative}/media/users/{if $users[i].photo == ''}nopic-{$users[i].gender}.gif{else}{$users[i].photo}{/if}" alt="{$users[i].username}'s avatar" /><br /><span class="font-12">{$users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            <div class="clear_left"></div>
            <div class="pagination"><ul>{$page_link}</ul></div><br />
        </div>
        <div class="box">
			<div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='search_users_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
		</div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='search_users_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>