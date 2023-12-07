drop function if exists dbo.fun_get_m_hinshu
go
create function fun_get_m_hinshu
(
    @kaitei_date date
    ,@hinshu_cd varchar(20)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,hinshu_cd
        ,hinshu_daibunrui_cd
        ,hinshu_chubunrui_cd
        ,hinshu_nm
        ,hinshu_eng_nm
        ,hinshu_kbn
        ,seihin_bunrui_cd_1
        ,seihin_bunrui_cd_2
        ,seihin_bunrui_cd_3
        ,seihin_bunrui_cd_4
        ,seihin_bunrui_cd_5
        ,seihin_bunrui_cd_6
        ,seihin_bunrui_cd_7
        ,zaiko_kanri_kbn
        ,seihin_no
        ,paper_weight
        ,width
        ,length
        ,kamaki_length
        ,kamaki_rate
        ,yakuhin_koeibun
        ,unit_cd
        ,unit_nm
        ,unit_juryo
        ,case_irisu
        ,pakku_irisu
        ,laminated_su
        ,bale_su
        ,fukuro_su
        ,juryo
        ,hiritsu
        ,ganshin_ryo
        ,ganshin_nodo
        ,coating_amount
        ,coating_nodo
        ,yakuhin_kigo
        ,kokeibun
        ,kokei_haigo_hi
        ,gentan_color
        ,gentan_width
        ,spec
        ,lip
        ,spec_maisu
        ,fsc_kbn
        ,kotei_cd
        ,tax_calc_kbn
        ,tax_rate_kbn
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
            ,hinshu_daibunrui_cd
            ,hinshu_chubunrui_cd
            ,hinshu_nm
            ,hinshu_eng_nm
            ,hinshu_kbn
            ,seihin_bunrui_cd_1
            ,seihin_bunrui_cd_2
            ,seihin_bunrui_cd_3
            ,seihin_bunrui_cd_4
            ,seihin_bunrui_cd_5
            ,seihin_bunrui_cd_6
            ,seihin_bunrui_cd_7
            ,zaiko_kanri_kbn
            ,seihin_no
            ,paper_weight
            ,width
            ,length
            ,kamaki_length
            ,kamaki_rate
            ,yakuhin_koeibun
            ,unit_cd
            ,unit_nm
            ,unit_juryo
            ,case_irisu
            ,pakku_irisu
            ,laminated_su
            ,bale_su
            ,fukuro_su
            ,juryo
            ,hiritsu
            ,ganshin_ryo
            ,ganshin_nodo
            ,coating_amount
            ,coating_nodo
            ,yakuhin_kigo
            ,kokeibun
            ,kokei_haigo_hi
            ,gentan_color
            ,gentan_width
            ,spec
            ,lip
            ,spec_maisu
            ,fsc_kbn
            ,kotei_cd
            ,tax_calc_kbn
            ,tax_rate_kbn
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_hinshu
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and hinshu_cd = @hinshu_cd
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