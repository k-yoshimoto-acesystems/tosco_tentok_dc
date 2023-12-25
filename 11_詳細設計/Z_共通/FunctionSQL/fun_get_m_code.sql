drop function if exists dbo.fun_get_m_code
go
create function fun_get_m_code
(
    @kaitei_date date
    ,@kbn varchar(8)
    ,@code varchar(30)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,kbn
        ,code
        ,name
        ,disp_order
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
            ,kbn
            ,code
            ,name
            ,disp_order
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_code
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and kbn = @kbn
            and code = @code
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