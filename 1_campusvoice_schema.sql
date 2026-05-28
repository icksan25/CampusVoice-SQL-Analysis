CREATE DATABASE campusVoice;
USE campusVoice;

CREATE TABLE pengguna(
user_id INT PRIMARY KEY,
nama TEXT,
prodi TEXT,
`role` TEXT
);

CREATE TABLE kategori(
kategori_id INT PRIMARY KEY,
nama_kategori TEXT
);

CREATE TABLE postingan(
post_id INT PRIMARY KEY,
user_id INT,
kategori_id INT,
tipe_post TEXT,
isi_teks TEXT,

FOREIGN KEY (user_id) REFERENCES pengguna(user_id),
FOREIGN KEY (kategori_id) REFERENCES kategori(kategori_id)
);

ALTER TABLE postingan ADD COLUMN `status` TEXT;

ALTER TABLE postingan DROP FOREIGN KEY postingan_ibfk_1;
ALTER TABLE pengguna MODIFY user_id VARCHAR(50);
ALTER TABLE postingan MODIFY user_id VARCHAR(50);
ALTER TABLE postingan ADD FOREIGN KEY (user_id) REFERENCES pengguna(user_id);

SHOW CREATE TABLE postingan;
SHOW INDEX FROM postingan;

INSERT INTO pengguna (user_id, nama, prodi, `role`)
VALUES('A1', 'HARIS', 'TEKNIK INFORMATIKA', 'ADMIN'),
('M1', 'ICKSAN', 'TEKNIK INFORMATIKA', 'MAHASISWA'),
('M2', 'GALANG', 'TEKNIK SIPIL', 'MAHASISWA');
INSERT INTO pengguna (user_id, nama, prodi, `role`)
VALUES('M3', 'HASBI', 'SISTEM INFORMASI', 'MAHASISWA'),
('M4', 'RESTU', 'TEKNIK ELEKTRO', 'MAHASISWA');

INSERT INTO kategori (kategori_id, nama_kategori)
VALUES(1, 'FASILITAS'),
(2, 'AKADEMIK'),
(3, 'KEUANGAN');

INSERT INTO postingan (post_id, user_id, kategori_id, tipe_post, isi_teks)
VALUES
(1, 'M1', 2, 'Aspirasi', 'Dosen banyak yang terlambat'),
(2, 'M1', 1, 'Informasi', 'AC di ruangan 206 mati'),
(3, 'M2', 3, 'Aspirasi', 'Keuangan untuk ormawa tidak transparan'),
(4, 'M2', 1, 'Aspirasi', 'Fasilitas yang didapat mahasiswa tidak sama apa yang sudah dibayar'),
(5, 'M3', 2, 'Informasi', 'Tidak bisa absen di aplikasi TIAS');

SELECT * FROM postingan;

ALTER TABLE pengguna MODIFY prodi VARCHAR(255);

UPDATE postingan SET `status` = CASE
	WHEN post_id IN (1, 3, 4) THEN 'Aktif'
	WHEN post_id IN (2, 5) THEN 'Selesai'
END 
WHERE post_id IN (1, 2, 3, 4, 5);


