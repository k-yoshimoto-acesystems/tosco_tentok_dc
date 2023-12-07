IF OBJECT_ID ('funB_getitems_t_juchu_h') IS NOT NULL
	DROP FUNCTION funB_getitems_t_juchu_h;
GO
CREATE FUNCTION funB_getitems_t_juchu_h (@juchu_no VARCHAR(100), @item_kbn VARCHAR(1))
RETURNS VARCHAR(30)
AS
BEGIN
	--変数宣言
	DECLARE @vname VARCHAR(30)

	BEGIN
		select
			@vname = string_agg(IsNull(item_value, ''), ',') within group (order by ordinal)
		from
			string_split(@juchu_no, ',', 1) 
		left join
			(
			select
				value as juchu_no
				,case when @item_kbn = '1' then t_juchu_h.shukka_yotei_date
					when @item_kbn = '2' then t_juchu_h.suryo
					when @item_kbn = '3' then t_juchu_h.hikiate_zaiko_su
					else juchu_no
				end as item_value
			from
				string_split(@juchu_no, ',', 1) 
			left join t_juchu_h
				on juchu_no = value
			) sub
		on sub.juchu_no = value
	END

	RETURN (@vname)
END
GO