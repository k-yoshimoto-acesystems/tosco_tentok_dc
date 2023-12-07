drop function if exists dbo.fun_get_m_riyosha
go
create function fun_get_m_riyosha
(
    @kaitei_date date
    ,@user_cd varchar(10)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,user_cd
        ,user_nm
        ,user_short_nm
        ,password
        ,yukokigen
        ,kijun_date
        ,session_timeout
        ,shukan_busho_cd
        ,shukan_kotei_cd
        ,seisan_jokyo_auth_flg
        ,system_auth_flg
        ,saishu_shonin_auth_flg
        ,seihin_bunrui_flg_1
        ,seihin_bunrui_flg_2
        ,seihin_bunrui_flg_3
        ,seihin_bunrui_flg_4
        ,seihin_bunrui_flg_5
        ,seihin_bunrui_flg_6
        ,seihin_bunrui_flg_7
        ,delete_flg
        ,insert_user_cd
        ,insert_user_nm
        ,insert_datetime
        ,update_user_cd
        ,update_user_nm
        ,update_datetime
    from
    (
        select top 1
            kaitei_date
            ,user_cd
            ,user_nm
            ,user_short_nm
            ,password
            ,yukokigen
            ,kijun_date
            ,session_timeout
            ,shukan_busho_cd
            ,shukan_kotei_cd
            ,seisan_jokyo_auth_flg
            ,system_auth_flg
            ,saishu_shonin_auth_flg
            ,seihin_bunrui_flg_1
            ,seihin_bunrui_flg_2
            ,seihin_bunrui_flg_3
            ,seihin_bunrui_flg_4
            ,seihin_bunrui_flg_5
            ,seihin_bunrui_flg_6
            ,seihin_bunrui_flg_7
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_riyosha
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and user_cd = @user_cd
        order by
            kaitei_date desc
    ) a
    where
        @delete_flg = '0'
        or (
            @delete_flg = '1'
            and delete_flg = '0'
        )
        
go