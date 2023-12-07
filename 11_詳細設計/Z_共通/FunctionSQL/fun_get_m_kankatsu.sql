drop function if exists dbo.fun_get_m_kankatsu
go
create function fun_get_m_kankatsu
(
    @kaitei_date date
    ,@kankatsu_cd varchar(10)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,kankatsu_cd
        ,kankatsu_nm
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
            ,kankatsu_cd
            ,kankatsu_nm
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_kankatsu
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and kankatsu_cd = @kankatsu_cd
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