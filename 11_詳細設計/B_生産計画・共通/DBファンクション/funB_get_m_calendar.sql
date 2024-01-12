create function funB_get_m_calendar
(
    @kinmu_flg varchar(1)
    ,@busho_cd varchar(4)
    ,@kotei_cd varchar(4)
    ,@calendar_date_from datetime2
    ,@calendar_date_to datetime2
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        nendo
        ,busho_cd
        ,kotei_cd
        ,calendar_date
        ,kyujitsu_flg
        ,start_time
        ,end_time
        ,kinmu_a
        ,kinmu_a_start_time
        ,kinmu_a_end_time
        ,kinmu_b
        ,kinmu_b_start_time
        ,kinmu_b_end_time
        ,kinmu_c
        ,kinmu_c_start_time
        ,kinmu_c_end_time
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
        @kinmu_flg = '0'
        and busho_cd = @busho_cd
        and kotei_cd = @kotei_cd
        and start_time >= @calendar_date_from
        and (
            @calendar_date_to is null
            or (
                @calendar_date_to is not null
                and end_time <= @calendar_date_to
            )
        )
        and (
            @delete_flg = '0'
            or (
                @delete_flg = '1'
                and delete_flg = '0'
            )
        )
    union
    select
        nendo
        ,busho_cd
        ,kotei_cd
        ,calendar_date
        ,kyujitsu_flg
        ,start_time
        ,end_time
        ,kinmu_a
        ,kinmu_a_start_time
        ,kinmu_a_end_time
        ,kinmu_b
        ,kinmu_b_start_time
        ,kinmu_b_end_time
        ,kinmu_c
        ,kinmu_c_start_time
        ,kinmu_c_end_time
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
        @kinmu_flg = '1'
        and kinmu_a = '1'
        and busho_cd = @busho_cd
        and kotei_cd = @kotei_cd
        and kinmu_a_start_time >= @calendar_date_from
        and (
            @calendar_date_to is null
            or (
                @calendar_date_to is not null
                and kinmu_a_end_time <= @calendar_date_to
            )
        )
        and (
            @delete_flg = '0'
            or (
                @delete_flg = '1'
                and delete_flg = '0'
            )
        )
    union
    select
        nendo
        ,busho_cd
        ,kotei_cd
        ,calendar_date
        ,kyujitsu_flg
        ,start_time
        ,end_time
        ,kinmu_a
        ,kinmu_a_start_time
        ,kinmu_a_end_time
        ,kinmu_b
        ,kinmu_b_start_time
        ,kinmu_b_end_time
        ,kinmu_c
        ,kinmu_c_start_time
        ,kinmu_c_end_time
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
        @kinmu_flg = '1'
        and kinmu_b = '1'
        and busho_cd = @busho_cd
        and kotei_cd = @kotei_cd
        and kinmu_b_start_time >= @calendar_date_from
        and (
            @calendar_date_to is null
            or (
                @calendar_date_to is not null
                and kinmu_b_end_time <= @calendar_date_to
            )
        )
        and (
            @delete_flg = '0'
            or (
                @delete_flg = '1'
                and delete_flg = '0'
            )
        )
    union
    select
        nendo
        ,busho_cd
        ,kotei_cd
        ,calendar_date
        ,kyujitsu_flg
        ,start_time
        ,end_time
        ,kinmu_a
        ,kinmu_a_start_time
        ,kinmu_a_end_time
        ,kinmu_b
        ,kinmu_b_start_time
        ,kinmu_b_end_time
        ,kinmu_c
        ,kinmu_c_start_time
        ,kinmu_c_end_time
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
        @kinmu_flg = '1'
        and kinmu_c = '1'
        and busho_cd = @busho_cd
        and kotei_cd = @kotei_cd
        and kinmu_c_start_time >= @calendar_date_from
        and (
            @calendar_date_to is null
            or (
                @calendar_date_to is not null
                and kinmu_c_end_time <= @calendar_date_to
            )
        )
        and (
            @delete_flg = '0'
            or (
                @delete_flg = '1'
                and delete_flg = '0'
            )
        )
