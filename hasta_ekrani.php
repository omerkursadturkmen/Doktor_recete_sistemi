<!DOCTYPE html>
<html>
<head>
	<title>Hasta Geçmiş Ekranı</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script>
	function myFunction() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("ilacListe");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[0];
		if (td) {
		  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			tr[i].style.display = "";
		  } else {
			tr[i].style.display = "none";
		  }
		}       
	  }
	}
	
		
	function recetecagir(receteid, hastano) {
    location.href="hasta_ilac.php?receteno="+receteid+"&hastano="+hastano;
	}
	</script>
	
</head>

<body>

	<div class="container">
		<div class="jumbotron" style="height: 150px; color: white; text-shadow: #444 0 1px 1px; background-color:#ad4141;">
	<?php

	$hastano=$_GET["hastano"];
				$baglan=mysqli_connect("Localhost","root","","doktor_recete_sistemi");
				mysqli_query($baglan,"SET NAMES UTF8");
				if(!$baglan){
					die("Bağlantı Başarısız".mysqli_connect_error());
				}
				else
				{
					echo " <br>";
				}

	
	$sorgu="select * from hastalar Where hasta_no=".$hastano;
				$a=mysqli_query($baglan,$sorgu);
				$rowhasta=mysqli_fetch_assoc($a);
						echo " <h3 style='font-family: serif'>". $rowhasta["hasta_adi"]." ".$rowhasta["hasta_soyadi"]." "."adlı hastanın bilgileri</h3>"
				
	?>
		
			
		</div>
		<div>
			<table id="ilacListe" class="table">
				<thead class="table-info">
					<tr>
						<th></th>
						<th>Kolesterol</th>
						<th>LDL</th>
						<th>Sigara</th>
						<th>Alkol</th>
						<th>Kan Şekeri</th>
						<th>Trigliserid</th>
						<th>Hipertansiyon</th>
						<th>Penisilin Alerjisi</th>
					</tr>
				</thead>
				<?php
				
				
				
				$sorgu="select * from hastarecete_gor Where hasta_no=".$hastano;
				$a=mysqli_query($baglan,$sorgu);

				if(mysqli_num_rows($a)>0)
				{
					while($row=mysqli_fetch_assoc($a)){
						echo '<td><input type="button" name="button[]" onClick="recetecagir('.$row["recete_id"].','.$row["hasta_no"].')" value="Reçete Geçmişini Gör" class="btn btn-primary" id="myBtn"><td>'. $row["kolesterol"]. "</td><td>". $row["ldl"]. "</td><td>". $row["sigara"]. "</td><td>". $row["alkol"]. "</td><td>". $row["kan_sekeri"]. "</td><td>". $row["trigliserid"]. "</td><td>". $row["hipertansiyon"]. "</td><td>". $row["penisilin_alerjisi"]. "</td></tr>";
					}
				}
				else{
					echo "Daha Önce İlaç Eklenmemiştir.";
				}
				
				mysqli_close($baglan);
				?>
			</table>
		</div>

	</div>




















</body>
</html>