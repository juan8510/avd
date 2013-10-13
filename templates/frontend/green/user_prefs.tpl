<div id="content">
    <div id="user_profile">
    <form name="user_prefs_form" id="user_prefs_form" method="post" action="{$relative}/user/prefs">
    <div class="left span-400">
        <div class="box">            
            <div class="btitle"><h2>{t c='user.PREFS_TITLE'}</h2></div>
            <br />
            <div class="profile_bl">&nbsp;</div>
            <div class="profile_blr">{t c='global.public'}</div>
            <div class="profile_blm">{t c='user.only_friends'}</div>
            <div class="profile_blr">{t c='user.only_me'}</div>
            <div class="clear_left"></div>            
            <div class="profile_bl">{t c='global.show'} {t c='user.playlist'}</div>
            <div class="profile_blr"><input name="show_playlist" type="radio" value="2" class="radio"{if $prefs.show_playlist == '2'} checked="checked"{/if} /></div>
            <div class="profile_blm"><input name="show_playlist" type="radio" value="1" class="radio"{if $prefs.show_playlist == '1'} checked="checked"{/if} /></div>
            <div class="profile_blr"><input name="show_playlist" type="radio" value="0" class="radio"{if $prefs.show_playlist == '0'} checked="checked"{/if} /></div>
            <div class="clear_left"></div>            
            <div class="profile_bl">{t c='global.show'} {t c='user.favorites'}</div>
            <div class="profile_blr"><input name="show_favorites" type="radio" value="2" class="radio"{if $prefs.show_favorites == '2'} checked="checked"{/if} /></div>
            <div class="profile_blm"><input name="show_favorites" type="radio" value="1" class="radio"{if $prefs.show_favorites == '1'} checked="checked"{/if} /></div>
            <div class="profile_blr"><input name="show_favorites" type="radio" value="0" class="radio"{if $prefs.show_favorites == '0'} checked="checked"{/if} /></div>
            <div class="clear_left"></div>            
            <div class="profile_bl">{t c='global.show'} {t c='user.friend'} {t c='global.list'}</div>
            <div class="profile_blr"><input name="show_friends" type="radio" value="2" class="radio"{if $prefs.show_friends == '2'} checked="checked"{/if} /></div>
            <div class="profile_blm"><input name="show_friends" type="radio" value="1" class="radio"{if $prefs.show_friends == '1'} checked="checked"{/if} /></div>
            <div class="profile_blr"><input name="show_friends" type="radio" value="0" class="radio"{if $prefs.show_friends == '0'} checked="checked"{/if} /></div>
            <div class="clear_left"></div>            
            <div class="profile_bl">{t c='global.show'} {t c='user.subscriptions'}</div>
            <div class="profile_blr"><input name="show_subscriptions" type="radio" value="2" class="radio"{if $prefs.show_subscriptions == '2'} checked="checked"{/if} /></div>
            <div class="profile_blm"><input name="show_subscriptions" type="radio" value="1" class="radio"{if $prefs.show_subscriptions == '1'} checked="checked"{/if} /></div>
            <div class="profile_blr"><input name="show_subscriptions" type="radio" value="0" class="radio"{if $prefs.show_subscriptions == '0'} checked="checked"{/if} /></div>
            <div class="clear_left"></div>            
            <div class="profile_bl">{t c='global.show'} {t c='user.subscribers'}</div>
            <div class="profile_blr"><input name="show_subscribers" type="radio" value="2" class="radio"{if $prefs.show_subscribers == '2'} checked="checked"{/if} /></div>
            <div class="profile_blm"><input name="show_subscribers" type="radio" value="1" class="radio"{if $prefs.show_subscribers == '1'} checked="checked"{/if} /></div>
            <div class="profile_blr"><input name="show_subscribers" type="radio" value="0" class="radio"{if $prefs.show_subscribers == '0'} checked="checked"{/if} /></div>
            <div class="clear_left"></div>            
            <br />
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='user.ACCOUNT_PREF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_friend_requests" class="mega">{t c='user.friends_auto'}:</label>
                <input name="friends_requests" type="checkbox" id="profile_friend_requests" class="checkbox"{if $prefs.friends_requests == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_wall_public" class="mega">{t c='user.wall_public'}:</label>
                <input name="wall_public" type="checkbox" id="profile_wall_public" class="checkbox"{if $prefs.wall_public == '1'} checked="checked"{/if} />
            </div>
            <br />
        </div>
    </div>
    <div class="right span-550">
        <div class="box">
            <div class="btitle"><h2>{t c='user.EMAIL_NOTIF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_vapprove" class="mega">{t c='user.notif_video_approve'}:</label>
                <input name="video_approve" type="checkbox" id="profile_vapprove" class="checkbox"{if $prefs.video_approve == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_aapprove" class="mega">{t c='user.notif_album_approve'}:</label>
                <input name="album_approve" type="checkbox" id="profile_aapprove" class="checkbox"{if $prefs.album_approve == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_vsubscribe" class="mega">{t c='user.notif_subscribe'}:</label>
                <input name="video_subscribe" type="checkbox" id="profile_vsubscribe" class="checkbox"{if $prefs.video_subscribe == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_frequest" class="mega">{t c='user.notif_friend'}:</label>
                <input name="friend_request" type="checkbox" id="profile_frequest" class="checkbox"{if $prefs.friend_request == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_wwrite" class="mega">{t c='user.notif_wall'}:</label>
                <input name="wall_write" type="checkbox" id="profile_wwrite" class="checkbox"{if $prefs.wall_write == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_vcomment" class="mega">{t c='user.notif_video_comment'}:</label>
                <input name="video_comment" type="checkbox" id="profile_vcomment" class="checkbox"{if $prefs.video_comment == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_pcomment" class="mega">{t c='user.notif_photo_comment'}:</label>
                <input name="photo_comment" type="checkbox" id="profile_pcomment" class="checkbox"{if $prefs.photo_comment == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_bcomment" class="mega">{t c='user.notif_blog_comment'}:</label>
                <input name="blog_comment" type="checkbox" id="profile_bcomment" class="checkbox"{if $prefs.blog_comment == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_gcomment" class="mega">{t c='user.notif_game_comment'}:</label>
                <input name="game_comment" type="checkbox" id="profile_gcomment" class="checkbox"{if $prefs.game_comment == '1'} checked="checked"{/if} />
            </div>
            <div class="separator">
                <label for="profile_message" class="mega">{t c='user.notif_send_msg'}:</label>
                <input name="send_message" type="checkbox" id="profile_message" class="checkbox"{if $prefs.send_message == '1'} checked="checked"{/if} />
            </div>
            <br />
        </div>        
    </div>
    <div class="clear"></div>
    <div class="profile_trans">
        <input name="prefs_submit" type="submit" value=" {t c='user.save'} " id="profile_submit" class="profile_button">
    </div>    
    </form>
    </div>
</div>
