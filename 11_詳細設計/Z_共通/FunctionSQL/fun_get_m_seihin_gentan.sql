drop function if exists dbo.fun_get_m_seihin_gentan
go
create function fun_get_m_seihin_gentan
(
    @kaitei_date date
    ,@seihin_hinshu_cd varchar(20)
    ,@gentan_hinshu_cd varchar(20)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,seihin_hinshu_cd
        ,gentan_hinshu_cd
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
            ,seihin_hinshu_cd
            ,gentan_hinshu_cd
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_seihin_gentan
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and seihin_hinshu_cd = @seihin_hinshu_cd
            and gentan_hinshu_cd = @gentan_hinshu_cd
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