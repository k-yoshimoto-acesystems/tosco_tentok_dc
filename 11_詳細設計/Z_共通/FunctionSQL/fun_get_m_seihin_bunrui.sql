drop function if exists dbo.fun_get_m_seihin_bunrui
go
create function fun_get_m_seihin_bunrui
(
    @kaitei_date date
    ,@seihin_bunrui_kbn varchar(10)
    ,@seihin_bunrui_cd varchar(10)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,seihin_bunrui_kbn
        ,seihin_bunrui_cd
        ,seihin_bunrui_nm
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
            ,seihin_bunrui_kbn
            ,seihin_bunrui_cd
            ,seihin_bunrui_nm
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_seihin_bunrui
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and seihin_bunrui_kbn = @seihin_bunrui_kbn
            and seihin_bunrui_cd = @seihin_bunrui_cd
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