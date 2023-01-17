select pd.* from grommet_products as pd left join grommet_product_categories as pdc on pd.id = pdc.product_id left join grommet_gifts_categories cat on pdc.product_category_id = cat.id where cat.sub_category = 'Jewelry' and pd.is_sold_out = 0;

select pd.* from grommet_products as pd left join grommet_product_to_keyword as ptk on pd.id = ptk.product_id left join grommet_product_keywords as pk on ptk.keyword_id = pk.id where pk.keyword = 'Hair accessor' and pd.is_sold_out = 0;

select pd.* from grommet_products as pd left join grommet_product_categories as pdc on pd.id = pdc.product_id left join grommet_gifts_categories cat on pdc.product_category_id = cat.id left join grommet_product_to_keyword as ptk on pd.id = ptk.product_id left join grommet_product_keywords as pk on ptk.keyword_id = pk.id where (cat.sub_category = 'Beauty & Personal Care' or cat.sub_category = 'Skincare') and pd.is_sold_out = 0 and pk.keyword = 'Aromatherapy';
