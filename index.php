<!DOCTYPE html>
<html>
<head>
	<title>Doktor Reçete Sistemi</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script>
		function myFunction() {
    window.open("hasta_ekrani.php", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=350,left=350,width=450,height=350");
	}
	
	function hastaekranicagir(id) {
    location.href="hasta_ekrani.php?hastano="+id;
	}
	</script>
	
</head>

<body>	
	<div class="container">
		<div>
			<div class="jumbotron" style="height: 250px; color: white; text-shadow: #444 0 1px 1px; background-color:#5d447a;">
				<h1 class="display-3">DOKTOR REÇETE SİSTEMİ</h1>
				<p class="lead">Doktorların, hastalarına ilaç yazarkenki sürecine yardımcı olan bir karar destek sistemidir.</p>
			</div>
		</div>
		<div>
			<h2 style='font-family: serif'>Hasta Listesi</h2>
			<table id="hastaKayit" class="table table-striped">
				<thead class="table-info">
					<tr>
						<th></th>
						<th>ID</th>
						<th>Adı</th>
						<th>Soyadı</th>
						<th>Doğum Tarihi</th>
						<th>Telefon</th>
						<th>Adres</th>
						<th>Kayıt Tarihi</th>
					</tr>
				</thead>
				<?php
				$baglan=mysqli_connect("Localhost","root","","doktor_recete_sistemi");
				mysqli_query($baglan,"SET NAMES UTF8");
				if(!$baglan){
					die("Bağlantı Başarısız".mysqli_connect_error());
				}
				else
				{
					echo " <br>";
				}

				$sorgu="select * from hastalar";
				$a=mysqli_query($baglan,$sorgu);

				if(mysqli_num_rows($a)>0)
				{
					while($row=mysqli_fetch_assoc($a)){
						echo '<td><input type="button" name="button[]" value="Seç" class="btn btn-primary" onClick="hastaekranicagir('. $row["hasta_no"]. ')"><td>'. $row["hasta_no"]. "</td><td>". $row["hasta_adi"]. "</td><td>". $row["hasta_soyadi"]. "</td><td>". $row["dogum_tarihi"]. "</td><td>". $row["telefon"]. "</td><td>". $row["adres"]. "</td><td>". $row["kayit_tarihi"]. "</td></tr>";
					}
				}
				else{
					echo "0 result";
				}
				
				mysqli_close($baglan);
				?>
			</table>
		</div>

		
	</div>
	
</body>
</html>