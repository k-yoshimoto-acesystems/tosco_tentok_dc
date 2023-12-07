drop function if exists dbo.fun_get_m_calendar
go
create function fun_get_m_calendar
(
    @busho_cd varchar(4)
    ,@kotei_cd varchar(4)
    ,@calendar_date date
    ,@delete_flg varchar(1)
)
returns table
as
return
    select top 1
        nendo
        ,busho_cd
        ,kotei_cd
        ,calendar_date
        ,kyujitsu_flg
        ,start_time
        ,end_time
        ,kinmu_a
        ,kinmu_b
        ,kinmu_c
        ,cf_kinmu_b
        ,delete_flg
        ,insert_user_cd
        ,insert_user_nm
        ,insert_datetime
        ,update_user_cd
        ,update_user_nm
        ,update_datetime
    from
        m_calendar
    where
        busho_cd = @busho_cd
        and kotei_cd = @kotei_cd
        and calendar_date = convert(varchar(8), @calendar_date, 112)
        and (
            @delete_flg = '0'
            or (
                @delete_flg = '1'
                and delete_flg = '0'
            )
        )
go