<?php
ob_start();
//koneksi database
include ("koneksi.php");

error_reporting(0);

//menangkap sebuah data yang dikirim dari form
$nik            = $_POST['nik'];
$kd_unit        = $_POST['kd_unit'];
$nama_karyawan  = $_POST['nama_karyawan'];
$jabatan        = $_POST['jabatan'];
$email          = $_POST['email'];
$no_hp          = $_POST['no_hp'];
$username       = $_POST['username'];
$password       = $_POST['password'];

//menginput data ke database
mysqli_query($koneksi, "Insert into kelas value('$nik','$kd_unit','$nama_karyawan','$jabatan','$email','$no_hp','$username','$password')");

//mengalihkan halaman ke karyawan.php
header("location:karyawan.php");

?>
