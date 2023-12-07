drop function if exists dbo.fun_get_m_kotei
go
create function fun_get_m_kotei
(
    @kaitei_date date
    ,@kotei_cd varchar(4)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,kotei_cd
        ,kotei_nm
        ,kotei_ryaku_nm
        ,setsubi_flg
        ,hokan_basho_cd
        ,yakuhin_kokeibun_kbn
        ,max_width
        ,disp_order
        ,seizo_kotei
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
            ,kotei_cd
            ,kotei_nm
            ,kotei_ryaku_nm
            ,setsubi_flg
            ,hokan_basho_cd
            ,yakuhin_kokeibun_kbn
            ,max_width
            ,disp_order
            ,seizo_kotei
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_kotei
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
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