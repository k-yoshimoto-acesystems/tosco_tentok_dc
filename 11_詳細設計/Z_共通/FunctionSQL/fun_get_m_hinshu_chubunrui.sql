drop function if exists dbo.fun_get_m_hinshu_chubunrui
go
create function fun_get_m_hinshu_chubunrui
(
    @kaitei_date date
    ,@hinshu_daibunrui_cd varchar(2)
    ,@hinshu_chubunrui_cd varchar(4)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,hinshu_daibunrui_cd
        ,hinshu_chubunrui_cd
        ,hinshu_chubunrui_nm
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
            ,hinshu_daibunrui_cd
            ,hinshu_chubunrui_cd
            ,hinshu_chubunrui_nm
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_hinshu_chubunrui
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and hinshu_daibunrui_cd = @hinshu_daibunrui_cd
            and hinshu_chubunrui_cd = @hinshu_chubunrui_cd
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