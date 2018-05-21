<!DOCTYPE html>
<html>
<head>
	<title>Hasta Reçete Geçmişi</title>
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

		function ilacliste(receteno,hastano) {
    window.open("ilaclistesi.php?receteno="+receteno+"&hastano="+hastano+"&ilacno=", "is", "toolbar=yes,scrollbars=yes,resizable=yes,top=150,left=550,width=950,height=550");
	}



	</script>
	
</head>


<body>

	<div class="container">
	<div class="jumbotron" style="height: 150px; color: white; text-shadow: #444 0 1px 1px; background-color:#3185b2;">
	<?php

	$hastano=$_GET["hastano"];
	$receteno=$_GET["receteno"];
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
						echo " <h3 style='font-family: serif'>". $rowhasta["hasta_adi"]." ".$rowhasta["hasta_soyadi"]."'in reçetesindeki ilaç geçmişi</h3>"
				
	?>
		
			
		</div>
		<div>
			<div style="float: right;">
			<?php	echo "<input type='button' name='button[]' value='İlaç Ekle' class='btn-lg btn-primary' id='myBtn' onClick='ilacliste(".$receteno.",".$hastano.")'>"; ?>
			</div>
			<h4>İlaç Listesi</h4>
			<table id="ilacListe" class="table">
				<thead class="bg-warning">
					<tr>
						<th>Adı</th>
						<th>Etkileşimi</th>
						<th>Fiyatı</th>
						<th>Tarih</th>
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
				

				$sorgu="select * from receteilac_gor Where recete_id=".$receteno;
				$a=mysqli_query($baglan,$sorgu);
				
				

				if(mysqli_num_rows($a)>0)
				{
					while($row=mysqli_fetch_assoc($a)){
						
						echo "<tr><td>". $row["ilac_adi"].  "</td><td>". $row["ilac_etkilesim"]. "</td><td>". $row["fiyat"]." TL". "</td><td>". $row["tarih"]. "</td></tr>";
					}
				}
						
				mysqli_close($baglan);
					?>
			</table>
		</div>

	</div>


</body>
</html>