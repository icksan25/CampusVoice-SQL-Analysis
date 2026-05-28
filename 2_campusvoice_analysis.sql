#Tugas 2A: Laporan Beban Masalah (JOIN + Agregasi + Filtering)
#Pihak Rektorat ingin melihat prodi mana yang mahasiswanya paling banyak memiliki masalah yang belum terselesaikan.
SELECT pengguna.prodi, COUNT(postingan.post_id) AS total_postingan
FROM pengguna 
JOIN postingan ON pengguna.user_id = postingan.user_id
WHERE postingan.`status` = 'Aktif'
GROUP BY pengguna.prodi;

#Tugas 2B: Daftar Panggilan Rapat (Set Operator: UNION)
#Ketua BEM ingin mengadakan rapat gabungan darurat. Dia butuh satu daftar nama mahasiswa untuk diundang.
SELECT pengguna.nama FROM pengguna WHERE prodi = 'TEKNIK INFORMATIKA'
UNION 
SELECT pengguna.nama FROM pengguna 
JOIN postingan ON postingan.user_id = pengguna.user_id
JOIN kategori ON postingan.kategori_id = kategori.kategori_id WHERE nama_kategori = 'FASILITAS';

SELECT pengguna.nama FROM pengguna

#Menjaga Kebersihan Data (Constraints)
ALTER TABLE postingan
ADD CONSTRAINT cek_tipe_post CHECK (tipe_post IN ('Aspirasi', 'Informasi'));

SELECT * FROM postingan;

#Investigasi Mahasiswa Pasif (Subquery)
SELECT nama, prodi 
FROM pengguna
WHERE user_id NOT IN
((SELECT user_id FROM postingan));

#Persiapan Data Machine Learning (Views)
CREATE VIEW dataset_nlp_aspirasi AS
SELECT p.nama, k.nama_kategori, post.isi_teks 
FROM pengguna p
JOIN postingan post ON p.user_id = post.user_id
JOIN kategori k ON post.kategori_id = k.kategori_id
WHERE post.tipe_post = 'Aspirasi';

SELECT * FROM dataset_nlp_aspirasi;

#Optimasi Kecepatan Dashboard (Index)
CREATE INDEX idx_prodi_pengguna 
ON pengguna(prodi);