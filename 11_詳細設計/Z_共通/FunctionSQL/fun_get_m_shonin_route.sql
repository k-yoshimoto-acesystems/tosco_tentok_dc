drop function if exists dbo.fun_get_m_shonin_route
go
create function fun_get_m_shonin_route
(
    @kaitei_date date
    ,@kino_cd varchar(10)
    ,@user_cd varchar(10)
    ,@shoninsha_cd varchar(10)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,kino_cd
        ,user_cd
        ,shoninsha_cd
        ,shonin_order
        ,doho_flg
        ,saishu_shonin_flg
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
            ,kino_cd
            ,user_cd
            ,shoninsha_cd
            ,shonin_order
            ,doho_flg
            ,saishu_shonin_flg
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_shonin_route
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and kino_cd = @kino_cd
            and user_cd = @user_cd
            and shoninsha_cd = @shoninsha_cd
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