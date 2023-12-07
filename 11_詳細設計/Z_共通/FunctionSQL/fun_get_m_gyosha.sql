drop function if exists dbo.fun_get_m_gyosha
go
create function fun_get_m_gyosha
(
    @kaitei_date date
    ,@gyosha_cd varchar(5)
    ,@delete_flg varchar(1)
)
returns table
as
return
    select
        kaitei_date
        ,gyosha_cd
        ,gyosha_nm
        ,gyosha_kana_nm
        ,gyosha_eng_nm
        ,tokuisaki_flg
        ,shiiresaki_flg
        ,gaichukakosaki_flg
        ,nounyusaki_flg
        ,atsukaiten_flg
        ,unsokaisha_flg
        ,itaku_sales_kbn
        ,kokunai_kaigai_kbn
        ,gyosha_ryaku_nm
        ,gyosha_ryaku_kana_nm
        ,post_no
        ,address
        ,phone_no
        ,fax_no
        ,tantosya_nm_1
        ,tantosya_buka_1
        ,tantosya_nm_2
        ,tantosya_buka_2
        ,address_eng
        ,phone_no_eng
        ,hontai_calc_kbn
        ,tax_calc_kbn
        ,tax_rate_kbn
        ,kankatsu_cd
        ,uriage_shimebi
        ,qty_calc_kbn
        ,kaishu_gessu
        ,kaishubi
        ,kaishu_kbn
        ,kaishu_amount
        ,kaishu_site
        ,shiire_shimebi
        ,shiharai_tsukisu
        ,shiharaibi
        ,cw_prod_disp_flg
        ,cw_prod_detail
        ,mix_prod_disp_flg
        ,mix_prod_detail
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
            ,gyosha_cd
            ,gyosha_nm
            ,gyosha_kana_nm
            ,gyosha_eng_nm
            ,tokuisaki_flg
            ,shiiresaki_flg
            ,gaichukakosaki_flg
            ,nounyusaki_flg
            ,atsukaiten_flg
            ,unsokaisha_flg
            ,itaku_sales_kbn
            ,kokunai_kaigai_kbn
            ,gyosha_ryaku_nm
            ,gyosha_ryaku_kana_nm
            ,post_no
            ,address
            ,phone_no
            ,fax_no
            ,tantosya_nm_1
            ,tantosya_buka_1
            ,tantosya_nm_2
            ,tantosya_buka_2
            ,address_eng
            ,phone_no_eng
            ,hontai_calc_kbn
            ,tax_calc_kbn
            ,tax_rate_kbn
            ,kankatsu_cd
            ,uriage_shimebi
            ,qty_calc_kbn
            ,kaishu_gessu
            ,kaishubi
            ,kaishu_kbn
            ,kaishu_amount
            ,kaishu_site
            ,shiire_shimebi
            ,shiharai_tsukisu
            ,shiharaibi
            ,cw_prod_disp_flg
            ,cw_prod_detail
            ,mix_prod_disp_flg
            ,mix_prod_detail
            ,delete_flg
            ,insert_user_cd
            ,insert_user_nm
            ,insert_datetime
            ,update_user_cd
            ,update_user_nm
            ,update_datetime
        from
            m_gyosha
        where
            kaitei_date <= convert(varchar(8), @kaitei_date, 112)
            and gyosha_cd = @gyosha_cd
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