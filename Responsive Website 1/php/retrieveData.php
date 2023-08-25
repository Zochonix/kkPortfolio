<?php

$data = json_decode(file_get_contents('php://input'), true);

$keyword = $data["pass"];
$servername = "localhost";
$username = "differentuser";
$password = "differentpassword";

$conn = mysqli_connect($servername, $username, $password, "nameOfTable");

if (!$conn) {

  die("Connection failed: " . mysqli_connect_error());

}

$sql = "SELECT ProjectName, ProjectSynopsis, ProjectLanguages, ProjectTime,  ProjectReason FROM Projects WHERE ProjectCodename='" . $keyword . "'";

$result = mysqli_query($conn, $sql);

$rows = array();

if (mysqli_num_rows($result) > 0) {

    while ($r = mysqli_fetch_assoc($result)) {

        $rows[] = $r;
    
    }

    echo json_encode($rows);

}

else {

    echo json_encode(array("No results."  => "0"));

}

?>