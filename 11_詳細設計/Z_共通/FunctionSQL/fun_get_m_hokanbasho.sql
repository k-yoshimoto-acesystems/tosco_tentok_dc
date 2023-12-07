drop function if exists dbo.fun_get_m_hokanbasho
go
create function fun_get_m_hokanbasho
(
    @kaitei_date date
    ,@hokan_basho_cd varchar(3)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,hokan_basho_cd
        ,hokan_basho_nm
        ,hokan_basho_kbn
        ,tsumikomi_basho_flg
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
            ,hokan_basho_cd
            ,hokan_basho_nm
            ,hokan_basho_kbn
            ,tsumikomi_basho_flg
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_hokanbasho
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and hokan_basho_cd = @hokan_basho_cd
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