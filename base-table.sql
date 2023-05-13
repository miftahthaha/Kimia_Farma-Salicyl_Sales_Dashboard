CREATE TABLE table_base AS(SELECT
						   	CONCAT(pjln.id_invoice, ' - ', pjln.id_barang) AS id_penjualan,
						   	pjln.id_invoice, pjln.tanggal,
						   	pjln.id_customer, pjln.id_barang,
						   	pjln.jumlah_barang, pjln.unit,
						   	pjln.harga, pjln.mata_uang,
						   	plgn.level, plgn.nama,
						   	plgn.id_cabang_sales, plgn.cabang_sales,
						   	plgn.id_distributor, plgn.grup,
						   	brg.kode_barang, brg.nama_barang,
						   	brg.kemasan, brg.nama_tipe,
						   	brg.kode_brand, brg.brand
						   FROM penjualan AS pjln
						   LEFT JOIN pelanggan AS plgn ON plgn.id_customer = pjln.id_customer
						   LEFT JOIN barang AS brg ON brg.kode_barang = pjln.id_barang
						   );
						   
ALTER TABLE table_base ADD PRIMARY KEY(id_penjualan);

COPY(SELECT *
	 FROM table_base
	) TO 'E:\Bootcamp\Rakamin Bootcamp Data Scientist\62 VIX\VIX Kimia Farma\base_table.csv'
	DELIMITER ',' 
	CSV HEADER;