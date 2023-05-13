CREATE TABLE table_aggregation AS(SELECT
							   	id_penjualan, id_invoice,
							   	tanggal, id_customer,
						   		id_barang, jumlah_barang,
						   		harga, nama AS customer,
							   	id_cabang_sales, cabang_sales,
						   		id_distributor, grup,
						   		nama_barang AS barang, kemasan,
						   		nama_tipe, kode_brand,
						   		brand,
							   	SUM(jumlah_barang * harga) AS total_penjualan
							   FROM table_base
							   GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
							  );

COPY(SELECT *
	 FROM table_aggregation
	) TO 'E:\Bootcamp\Rakamin Bootcamp Data Scientist\62 VIX\VIX Kimia Farma\aggregation_table.csv' 
	DELIMITER ',' 
	CSV HEADER;