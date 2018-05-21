<!DOCTYPE html>
<html>
<head>
	<title>İlaç Listesi</title>
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
	
	function recetecontrol(receteno, hastano,ilacno)
	{
		location.href="ilaclistesi.php?receteno="+receteno+"&hastano="+hastano+"&ilacno="+ilacno;
		
	}
	function receteyenile(receteno, hastano,ilacno)
	{
		window.opener.location="hasta_ilac.php?receteno="+receteno+"&hastano="+hastano+"&ilacno="+ilacno;
		self.close();
		return false;
	}
	</script>
	
</head>

<body>

	<div class="container-fluid">
		<div class="page-header" class="align-bottom">
			<h3 style="font-family: serif">Hasta için ilaç seç:</h3>
		</div>
		<div>
			<h5>İlaç Listesi</h5>
			<input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="İlaç ara.." title="ilaç aratın">
			<table id="ilacListe" class="table">
				<thead class="bg-info">
					<tr>
						<th>Adı</th>
						<th>ID</th>
						<th>Fiyatı</th>
						<th>Etkileşim</th>
						<th></th>
					</tr>
				</thead>
				<?php
				
				$receteno=$_GET["receteno"];
				$hastano=$_GET["hastano"];
				$ilacno=$_GET["ilacno"];
				
				$baglan=mysqli_connect("Localhost","root","","doktor_recete_sistemi");
				mysqli_query($baglan,"SET NAMES UTF8");
				if(!$baglan){
					die("Bağlantı Başarısız".mysqli_connect_error());
				}
				else
				{
					echo " <br>";
				}
				if ($ilacno!="")
				{
					$sorgu="select * from recete_ilac  Where recete_id=".$receteno." and ilac_no=".$ilacno;
					$a=mysqli_query($baglan,$sorgu);
					
					if(mysqli_num_rows($a)>0){
						$row=mysqli_fetch_assoc($a);
						echo "<h3 class='text-center text-danger'><strong><br>Seçtiğiniz ilaç reçetede bulunmaktadır!!</strong></h3>" ;
					}
					else
					{
						$sorgu="select * from ilac_etkilesim as ie, ilaclar i  Where ie.checkilac_no=i.ilac_no and ie.ilac_no in (select ilac_no from receteilac_gor as ri Where ri.recete_id=".$receteno." ) and  ie.checkilac_no=".$ilacno;
						$a=mysqli_query($baglan,$sorgu);
						
						if(mysqli_num_rows($a)>0){
							$row=mysqli_fetch_assoc($a);
							echo "<h6 class='text-info'><br>Bu ilaç reçetenizdeki bir ilaçla etkileşiyor, reçeteyi gözden geçirin.<br></h6><h5><strong class='text-danger'>Etkileşim:".$row["etkilesim"]."</strong></h5>";
						}
						else
						{
							$ekle = "Insert Into recete_ilac (ilac_no,recete_id) values (".$ilacno.",".$receteno.")";
							$a=mysqli_query($baglan,$ekle);
							echo mysqli_error($baglan);
							//echo "bu ilac recetenizdeki EKLENEBİLİR" ;
							//echo $ekle;
							echo "<script type='text/javascript'>receteyenile(".$receteno.",".$hastano.",".$ilacno.")</script>'";
						}
					}
				
					
				}
				$sorgu="select * from ilaclar order by ilaclar.ilac_adi asc";
				$a=mysqli_query($baglan,$sorgu);

				if(mysqli_num_rows($a)>0)
				{
					while($row=mysqli_fetch_assoc($a)){
						echo "<tr><td>". $row["ilac_adi"]. "</td><td>". $row["ilac_no"]. "</td><td>". $row["fiyat"]." TL" . "</td><td>".  $row['ilac_etkilesim']. "<td><input type='button' name='button[]' value='Ekle' onClick='recetecontrol(".$receteno.",".$hastano.",".$row["ilac_no"].")' class='btn btn-success' id='myBtn'><td> </td></tr>";
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