drop function if exists dbo.fun_get_m_hinshu_tani
go
create function fun_get_m_hinshu_tani
(
    @kaitei_date date
    ,@hinshu_cd varchar(20)
    ,@unit_cd varchar(2)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,hinshu_cd
        ,unit_cd
        ,unit_juryo_cd
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
            ,hinshu_cd
            ,unit_cd
            ,unit_juryo_cd
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_hinshu_tani
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and hinshu_cd = @hinshu_cd
            and unit_cd = @unit_cd
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