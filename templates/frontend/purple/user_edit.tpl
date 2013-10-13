<div id="content">
    <div id="user_profile">
    <form name="user_profile_form" id="user_profile_form" method="post" action="{$relative}/user/edit">
    <div class="left span-350">
        <div class="box">            
            <div class="btitle"><h2>{t c='user.ACCOUNT_INF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_username" class="small">{t c='global.username'}:</label>
                <input name="username" type="text" value="{$username}" id="profile_username" readonly />
            </div>
            <div class="separator">
                <label for="profile_email" class="small">{t c='global.email'}:</label>
                <input name="email" type="text" value="{$user.email}" readonly />
            </div>
            <div class="separator">
                <label for="profile_password" class="small">{t c='global.password'}:</label>
                <input name="password" type="password" value="" id="profile_password" />
            </div>
            <div class="separator">
                <label for="profile_password_confirm" class="small">{t c='global.password_confirm'}:</label>
                <input name="password_confirm" type="password" value="" id="profile_password_confirm"/>
            </div>
            <br />
        </div>
        <div class="box">
            <div class="btitle"><h2>{t c='user.PERSONAL_INF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_fname" class="small">{t c='user.first_name'}:</label>
                <input name="fname" type="text" value="{$user.fname}" id="profile_fname" />
            </div>
            <div class="separator">
                <label for="profile_lname" class="small">{t c='user.last_name'}:</label>
                <input name="lname" type="text" value="{$user.lname}" id="profile_lname" />
            </div>
            <div class="separator">
                <label for="profile_gender" class="small">{t c='global.gender'}:</label>
                <select name="gender" id="profile_gender">
                <option value="Male"{if $user.gender == 'Male'} selected="selected"{/if}>{t c='global.male'}</option>
                <option value="Female"{if $user.gender == 'Female'} selected="selected"{/if}>{t c='global.female'}</option>
                </select>
            </div>
            <div class="separator">
                <label for="profile_bdate" class="small">{t c='user.birthday'}:</label>
                {html_select_date time=$user.bdate all_extra='id="profile_bdate"' start_year='1900'}
            </div>
            <div class="separator">
                <label for="profile_relation" class="small">{t c='user.relationship'}:</label>
                <select name="relation" id="profile_relation">
                <option value="">---</option>
                <option value="Single"{if $user.relation == 'Single'} selected="selected"{/if}>{t c='user.single'}</option>
                <option value="Taken"{if $user.relation == 'Taken'} selected="selected"{/if}>{t c='user.take'}</option>
                <option value="Open"{if $user.relation == 'Open'} selected="selected"{/if}>{t c='user.open'}</option>
                </select>
            </div>
            <div class="separator">
                <label for="profile_interested" class="small">{t c='global.interested'}:</label>
                <select name="interested" id="profile_interested">
                <option value="">---</option>
                <option value="Guys"{if $user.interested == 'Guys'} selected="selected"{/if}>{t c='global.guys'}</option>
                <option value="Girls"{if $user.interested == 'Girls'} selected="selected"{/if}>{t c='global.girls'}</option>
                <option value="Guys + Girls"{if $user.interested == 'Guys + Girls'} selected="selected"{/if}>{t c='global.guys_girls'}</option>
                </select>
            </div>
            <div class="separator">
                <label for="profile_website" class="small">{t c='global.website'}:</label>
                <input name="website" type="text" value="{$user.website}" id="profile_website" />
            </div>
            <br />
        </div>
        <div class="box">
            
            <div class="btitle"><h2>{t c='user.LOCATION_INF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_hometown" class="small">{t c='global.hometown'}:</label>
                <input name="town" type="text" value="{$user.town}" id="profile_town" />
            </div>
            <div class="separator">
                <label for="profile_city" class="small">{t c='global.city'}:</label>
                <input name="city" type="text" value="{$user.city}" id="profile_city" />
            </div>
            <div class="separator">
                <label for="profile_country" class="small">{t c='global.country'}:</label>
                <input name="country" type="text" value="{$user.country}" id="profile_country" />
            </div>
            <div class="separator">
                <label for="profile_occupation" class="small">{t c='global.occupation'}</label>
                <input name="occupation" type="text" value="{$user.occupation}" id="profile_occupation" />
            </div>
            <div class="separator">
                <label for="profile_company" class="small">{t c='global.company'}:</label>
                <input name="company" type="text" value="{$user.company}" id="profile_company" />
            </div>
            <div class="separator">
                <label for="profile_school" class="small">{t c='global.school'}</label>
                <input name="school" type="text" value="{$user.school}" id="profile_school" />
            </div>
            <br />
        </div>
    </div>
    <div class="right span-600">
        <div class="box">
            <div class="btitle"><h2>{t c='user.RANDOM_INF'}</h2></div>
            <br />
            <div class="separator">
                <label for="profile_about" class="large">{t c='global.about_me'}:</label>
                <textarea name="aboutme" id="profile_about">{$user.aboutme}</textarea>
            </div>
            <div class="separator">
                <label for="profile_interests" class="large">{t c='global.here_for'}:</label>
                <textarea name="interest_hobby" id="profile_interests">{$user.interest_hobby}</textarea>
            </div>
            <div class="separator">
                <label for="profile_movie" class="large">{t c='user.favorite_sex'}:</label>
                <textarea name="fav_movie_show" id="profile_movie">{$user.fav_movie_show}</textarea>
            </div>
            <div class="separator">
                <label for="profile_music" class="large">{t c='user.favorite_sex_partner'}:</label>
                <textarea name="fav_music" id="profile_music">{$user.fav_music}</textarea>
            </div>
            <div class="separator">
                <label for="profile_book" class="large">{t c='user.my_erogenic_zones'}:</label>
                <textarea name="fav_book" id="profile_book">{$user.fav_book}</textarea>
            </div>
            <div class="separator">
                <label for="profile_turnon" class="large">{t c='user.turn_on'}:</label>
                <textarea name="turnon" id="profile_turnon">{$user.turnon}</textarea>
            </div>
            <div class="separator">
                <label for="profile_turnoff" class="large">{t c='user.turn_off'}:</label>
                <textarea name="turnoff" id="profile_turnoff}">{$user.turnoff}</textarea>
            </div>
            <br />
        </div>        
    </div>
    <div class="clear"></div>
    <div class="profile_trans">
        <input name="profile_submit" type="submit" value=" {t c='user.save'} " id="profile_submit" class="profile_button">
    </div>    
    </form>
    </div>
</div>
