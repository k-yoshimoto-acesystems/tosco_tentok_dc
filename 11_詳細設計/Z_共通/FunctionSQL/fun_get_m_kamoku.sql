drop function if exists dbo.fun_get_m_kamoku
go
create function fun_get_m_kamoku
(
    @kaitei_date date
    ,@seikyu_bunrui_cd varchar(3)
    ,@bunrui_meisai_cd varchar(1)
    ,@kokunai_kaigai_kbn varchar(1)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,seikyu_bunrui_cd
        ,bunrui_meisai_cd
        ,kokunai_kaigai_kbn
        ,karikata_cd
        ,karikata_hojo_cd
        ,kashikata_cd
        ,kashikata_hojo_cd
        ,tekiyo_nm
        ,denpyo_no
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
            ,seikyu_bunrui_cd
            ,bunrui_meisai_cd
            ,kokunai_kaigai_kbn
            ,karikata_cd
            ,karikata_hojo_cd
            ,kashikata_cd
            ,kashikata_hojo_cd
            ,tekiyo_nm
            ,denpyo_no
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_kamoku
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and seikyu_bunrui_cd = @seikyu_bunrui_cd
            and bunrui_meisai_cd = @bunrui_meisai_cd
            and kokunai_kaigai_kbn = @kokunai_kaigai_kbn
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