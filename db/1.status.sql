ALTER TABLE `absensi` ADD `status` TINYINT(1) NOT NULL COMMENT '1=berangkat,2=telat, 3=pulang cepat, 4=pulang,5=izin, 6=absen' AFTER `karyawan_id`;