# CampusVoice: SQL Database Design & Analysis 📊

Sebuah *mini-project* yang berfokus pada perancangan *database* relasional dan analisis data menggunakan MySQL. Proyek ini mensimulasikan sistem *backend* untuk aplikasi penampung aspirasi mahasiswa di lingkungan kampus.

## 🛠️ Teknologi yang Digunakan
* **Database:** MySQL
* **Fokus Utama:** Data Definition Language (DDL), Data Manipulation Language (DML), Relational Logic, dan Data Analysis.

## 📋 Fitur & Struktur Proyek
Proyek ini dipecah menjadi dua bagian utama:

**1. Database Schema (`1_campusvoice_schema.sql`):** * Merancang 3 tabel utama (`pengguna`, `kategori`, `postingan`).
* Mengimplementasikan integritas data menggunakan `PRIMARY KEY`, `FOREIGN KEY`, dan batasan `CHECK Constraint`.

**2. Data Analysis & Optimization (`2_campusvoice_analysis.sql`):**
* **Multi-JOIN & Aggregation:** Mengidentifikasi program studi dengan beban masalah tertinggi.
* **Set Operators (UNION):** Menggabungkan kelompok data untuk panggilan rapat gabungan.
* **Subqueries:** Menemukan entitas pasif (pengguna yang tidak pernah membuat postingan).
* **Views:** Menyiapkan *dataset* NLP (`dataset_nlp_aspirasi`) yang bersih dan siap ditarik ke dalam Python untuk kebutuhan *Machine Learning*.
* **Indexing:** Mengoptimalkan kecepatan pencarian data *dashboard* admin.

## 🚀 Pelajaran yang Didapat
Melalui proyek ini, saya memantapkan pemahaman fundamental SQL, mulai dari merakit relasi antar-tabel yang kompleks hingga memastikan kebersihan data langsung dari level arsitektur *database*.
