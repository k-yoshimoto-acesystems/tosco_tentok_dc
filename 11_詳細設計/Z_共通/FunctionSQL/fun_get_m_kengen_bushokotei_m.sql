drop function if exists dbo.fun_get_m_kengen_bushokotei_m
go
create function fun_get_m_kengen_bushokotei_m
(
    @kaitei_date date
    ,@user_cd varchar(10)
    ,@kino_cd varchar(10)
    ,@busho_cd varchar(4)
    ,@kotei_cd varchar(4)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,user_cd
        ,kino_cd
        ,busho_cd
        ,kotei_cd
        ,henshu_auth_flg
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
            ,kino_cd
            ,busho_cd
            ,kotei_cd
            ,henshu_auth_flg
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_kengen_bushokotei_m
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and user_cd = @user_cd
            and kino_cd = @kino_cd
            and busho_cd = @busho_cd
            and kotei_cd = @kotei_cd
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