drop function if exists dbo.fun_get_m_busho
go
create function fun_get_m_busho
(
    @kaitei_date date
    ,@busho_cd varchar(4)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,busho_cd
        ,busho_nm
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
            ,busho_cd
            ,busho_nm
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_busho
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and busho_cd = @busho_cd
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