<script type="text/javascript" src="{$relative_tpl}/js/jquery.community-0.1.js"></script>
<div id="content">
    <div class="left span-755">
        {if $popular_users}
        <div class="box height-190">
            <div class="btop">
                <div class="btopl"><h2>{t c='community.most_popular'}</h2></div>
                <div id="loader_users_All_popular" class="btopc" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Loading..." /></div>
                <div class="btopr">
                    <a href="{$relative}/users?o=mp">{t c='global.view_more'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <input name="current_page_popular_All" type="hidden" value="1" id="current_page_popular_All" />
            <div class="bar_space_left">
                <a href="#prev_popular_users" id="prev_users_All_popular" class="prev_bar" style="display: none;"></a>
            </div>
            <div id="users_popular_All">
            {section name=i loop=$popular_users max=5}
            <div class="user_box">
                <a href="{$relative}/user/{$popular_users[i].username}"><img src="{$relative}/media/users/{if $popular_users[i].photo == ''}nopic-{$popular_users[i].gender}.gif{else}{$popular_users[i].photo}{/if}" width="100" height="120" alt="{$popular_users[i].username}'s avatar" /><br /><span class="font-12">{$popular_users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            </div>
            {if $total_pusers > 5}
            <div class="bar_space_right">
                <a href="#next_popular_users" id="next_users_All_popular" class="next_bar"></a>
            </div>
            {/if}
            <div class="clear"></div>            
        </div>
        {/if}
        {if $female_users}
        <div class="box height-190">
            <div class="btop">
                <div class="btopl"><h2>{t c='community.new_female'}</h2></div>
                <div id="loader_users_Female_new" class="btopc" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Loading..." /></div>
                <div class="btopr">
                    <a href="{$relative}/users?o=mr&amp;g=Female">{t c='global.view_more'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <input name="current_page_new_Female" type="hidden" value="1" id="current_page_new_Female" />
            <div class="bar_space_left">
                <a href="#prev_female_users" id="prev_users_Female_new" class="prev_bar" style="display: none;"></a>
            </div>
            <div id="users_new_Female">
            {section name=i loop=$female_users max=5}
            <div class="user_box">
                <a href="{$relative}/user/{$female_users[i].username}"><img src="{$relative}/media/users/{if $female_users[i].photo == ''}nopic-Female.gif{else}{$female_users[i].photo}{/if}" width="100" height="120" alt="{$female_users[i].username}'s avatar" /><br /><span class="font-12">{$female_users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            </div>
            {if $total_fusers > 5}
            <div class="bar_space_right">
                <a href="#next_female_users" id="next_users_Female_new" class="next_bar"></a>
            </div>
            {/if}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $male_users}
        <div class="box height-190">
            <div class="btop">
                <div class="btopl"><h2>{t c='community.new_male'}</h2></div>
                <div id="loader_users_Male_new" class="btopc" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Loading..." /></div>
                <div class="btopr">
                    <a href="{$relative}/users?o=mr&amp;g=Male">{t c='global.view_more'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <input name="current_page_new_Male" type="hidden" value="1" id="current_page_new_Male" />
            <div class="bar_space_left">
                <a href="#prev_male_users" id="prev_users_Male_new" class="prev_bar" style="display: none;"></a>
            </div>
            <div id="users_new_Male">
            {section name=i loop=$male_users max=5}
            <div class="user_box">
                <a href="{$relative}/user/{$male_users[i].username}"><img src="{$relative}/media/users/{if $male_users[i].photo == ''}nopic-Male.gif{else}{$male_users[i].photo}{/if}" width="100" height="120" alt="{$male_users[i].username}'s avatar" /><br /><span class="font-12">{$male_users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            </div>
            {if $total_musers > 5}
            <div class="bar_space_right">
                <a href="#next_male_users" id="next_users_Male_new" class="next_bar"></a>
            </div>
            {/if}
            <div class="clear"></div>
        </div>
        {/if}
        {if $online_female_users}
        <div class="box height-190">
            
            <div class="btop">
                <div class="btopl"><h2>{t c='community.online_female'}</h2></div>
                <div id="loader_users_Female_online" class="btopc" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Loading" /></div>
                <div class="btopr">
                    <a href="{$relative}/users?o=on&amp;g=Female">{t c='global.view_more'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <input name="current_page_online_Female" type="hidden" value="1" id="current_page_online_Female" />
            <div class="bar_space_left">
                <a href="#prev_female_users_online" id="prev_users_Female_online" class="prev_bar" style="display: none;"></a>
            </div>
            <div id="users_online_Female">
            {section name=i loop=$online_female_users max=5}
            <div class="user_box">
                <a href="{$relative}/user/{$online_female_users[i].username}"><img src="{$relative}/media/users/{if $online_female_users[i].photo == ''}nopic-Female.gif{else}{$online_female_users[i].photo}{/if}" width="100" height="120" alt="{$online_female_users[i].username}'s avatar" /><br /><span class="font-12">{$online_female_users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            </div>
            {if $total_ofusers > 5}
            <div class="bar_space_right">
                <a href="#next_female_users_online" id="next_users_Female_online" class="next_bar"></a>
            </div>
            {/if}
            <div class="clear_left"></div>
        </div>
        {/if}
        {if $online_male_users}
        <div class="box height-190">
            
            <div class="btop">
                <div class="btopl"><h2>{t c='community.online_male'}</h2></div>
                <div id="loader_users_Male_online" class="btopc" style="display: none;"><img src="{$relative_tpl}/images/ajax_loader_bar.gif" alt="Loading" /></div>
                <div class="btopr">
                    <a href="{$relative}/users?o=on&amp;g=Male">{t c='global.view_more'}</a>
                </div>
                <div class="clear"></div>
            </div>
            <input name="current_page_online_Male" type="hidden" value="1" id="current_page_online_Male" />
            <div class="bar_space_left">
                <a href="#prev_male_users_online" id="prev_users_Male_online" class="prev_bar" style="display: none;"></a>
            </div>            
            <div id="users_online_Male">
            {section name=i loop=$online_male_users max=5}
            <div class="user_box">
                <a href="{$relative}/user/{$online_male_users[i].username}"><img src="{$relative}/media/users/{if $online_male_users[i].photo == ''}nopic-Male.gif{else}{$online_male_users[i].photo}{/if}" width="100" height="120" alt="{$online_male_users[i].username}'s avatar" /><br /><span class="font-12">{$online_male_users[i].username|escape:'html'}</span></a><br />
            </div>
            {/section}
            </div>
            {if $total_omusers > 5}
            <div class="bar_space_right">
                <a href="#next_Male_users_online" id="next_users_Male_online" class="next_bar"></a>
            </div>
            {/if}
            <div class="clear_left"></div>
        </div>
        {/if}
  
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
        {insert name=adv assign=adv group='community_bottom'}
        {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="right span-200">
        <div class="box">
            <div class="btitle"><h2>{t c='global.sponsors'}</h2></div>
            {insert name=adv assign=adv group='community_right'}
            {if $adv}<br /><div class="ads">{$adv}</div><br />{/if}
        </div>
    </div>
    <div class="clear"></div>
</div>

