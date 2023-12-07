IF OBJECT_ID ('funB_getnames_m_gyosha') IS NOT NULL
	DROP FUNCTION funB_getnames_m_gyosha;
GO
CREATE FUNCTION funB_getnames_m_gyosha (@kaitei_date DATE, @gyosha_cd VARCHAR(100), @delete_flg VARCHAR(1))
RETURNS VARCHAR(150)
AS
BEGIN
	--変数宣言
	DECLARE @vname VARCHAR(150)
    
	IF @delete_flg = '0'
		--削除フラグ=0　条件有
		BEGIN
			select
				@vname = string_agg(IsNull(gyosha_nm, ''), ',') within group (order by ordinal)
			from
				string_split(@gyosha_cd, ',', 1) 
			left join
				(
				select
					gyosha_cd
					,gyosha_nm
				from
					(
					select
						value as gyosha_cd
						,gyosha_nm
						,row_number() over (partition by value order by kaitei_date desc) as rank
					from
						string_split(@gyosha_cd, ',', 1) 
					left join m_gyosha
						on gyosha_cd = value
					where
						kaitei_date <= (select convert(varchar(8), @kaitei_date, 112))
					and
						delete_flg = @delete_flg
					) m_gyosha
				where
					rank = 1
				) sub
			on sub.gyosha_cd = value
		END
	ELSE
		--削除フラグ=0　条件無
		BEGIN
			select
				@vname = string_agg(IsNull(gyosha_nm, ''), ',') within group (order by ordinal)
			from
				string_split(@gyosha_cd, ',', 1) 
			left join
				(
				select
					gyosha_cd
					,gyosha_nm
				from
					(
					select
						value as gyosha_cd
						,gyosha_nm
						,row_number() over (partition by value order by kaitei_date desc) as rank
					from
						string_split(@gyosha_cd, ',', 1) 
					left join m_gyosha
						on gyosha_cd = value
					where
						kaitei_date <= (select convert(varchar(8), @kaitei_date, 112))
					) m_gyosha
				where
					rank = 1
				) sub
			on sub.gyosha_cd = value
		END
	RETURN (@vname)
END
GO