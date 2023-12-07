IF OBJECT_ID ('funB_getnames_m_riyosha') IS NOT NULL
	DROP FUNCTION funB_getnames_m_riyosha;
GO
CREATE FUNCTION funB_getnames_m_riyosha (@kaitei_date DATE, @user_cd VARCHAR(20), @delete_flg VARCHAR(1))
RETURNS VARCHAR(150)
AS
BEGIN
	--変数宣言
	DECLARE @vname VARCHAR(150)
    
	IF @delete_flg = '0'
		--削除フラグ=0　条件有
		BEGIN
			select
				@vname = string_agg(IsNull(user_nm, ''), ',') within group (order by ordinal)
			from
				string_split(@user_cd, ',', 1) 
			left join
				(
				select
					user_cd
					,user_nm
				from
					(
					select
						value as user_cd
						,user_nm
						,row_number() over (partition by value order by kaitei_date desc) as rank
					from
						string_split(@user_cd, ',', 1) 
					left join m_riyosha
						on user_cd = value
					where
						kaitei_date <= (select convert(varchar(8), @kaitei_date, 112))
					and
						delete_flg = @delete_flg
					) m_riyosha
				where
					rank = 1
				) sub
			on sub.user_cd = value
		END
	ELSE
		--削除フラグ=0　条件無
		BEGIN
			select
				@vname = string_agg(IsNull(user_nm, ''), ',') within group (order by ordinal)
			from
				string_split(@user_cd, ',', 1) 
			left join
				(
				select
					user_cd
					,user_nm
				from
					(
					select
						value as user_cd
						,user_nm
						,row_number() over (partition by value order by kaitei_date desc) as rank
					from
						string_split(@user_cd, ',', 1) 
					left join m_riyosha
						on user_cd = value
					where
						kaitei_date <= (select convert(varchar(8), @kaitei_date, 112))
					) m_riyosha
				where
					rank = 1
				) sub
			on sub.user_cd = value
		END
	RETURN (@vname)
END
GO