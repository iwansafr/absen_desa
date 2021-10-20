<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Processing</title>
	<script>
		var _URL = "<?php echo base_url();?>"
	</script>
	<style>
    body {
      margin: 0;
      padding: 0;
      width: 100vw;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }

    canvas {
      position: absolute;
    }
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<?php if (!empty($data)): ?>
		<img src="<?php echo image_module('karyawan',$data['id'].'/'.$data['photo']);?>" height="100" alt="">
		<table>
			<tr>
				<td>Nama</td>
				<td>: <?= $data['nama'] ?></td>
			</tr>
			<tr>
				<td>Kelas</td>
				<td>: <?= $data['kelas'] ?></td>
			</tr>
			<tr>
				<td>Jabatan</td>
				<td>: <?= $data['jabatan'] ?> </td>
			</tr>
			<tr>
				<td colspan="2">Berhasil Masuk <i class="fa fa-check"></i></td>
			</tr>
		</table>
		<?php $text = 'selamat datang '.$data['nama']; ?>
	<?php else: ?>
		<?php $text = 'terima kasih' ?>
	<?php endif ?>
	  <button id="start" style="display: none;" class="btn btn-success mt-5 me-3">Start</button>
  <script>
  	let speech = new SpeechSynthesisUtterance();
		speech.lang = "id";
		speech.rate = 1;
		speech.volume = 1;
		speech.pitch = 1;

		let voices = [];
		window.speechSynthesis.onvoiceschanged = () => {
		  voices = window.speechSynthesis.getVoices();
		  speech.voice = voices[8];
		};
		const start = document.querySelector("#start")
		start.addEventListener("click", () => {
		  speech.text = "<?php echo $text;?>";
		  // speech.text = document.querySelector("textarea").value;
		  window.speechSynthesis.speak(speech);
		  console.log(speech)
		  // alert('test');
		});
		start.click();
		setTimeout(function(){
			// console.log('start click')
			// start.click();
			window.location.href = "<?php echo base_url('admin/absensi');?>"
			// setTimeout(function(){
			// 	console.log('location')
			// },2000)
		},2000)
		// function click(){

		// }
  </script>
</body>
</html>