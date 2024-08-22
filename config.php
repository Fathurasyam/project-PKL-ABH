<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "lokasi";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the requested layer
$layer = isset($_GET['layer']) ? $_GET['layer'] : '';

if ($layer) {
    $sql = "SELECT latitude, longitude, info FROM markers WHERE layer = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $layer);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $markers = [];
    while ($row = $result->fetch_assoc()) {
        // Add onclick to images in info for modal functionality
        $row['info'] = str_replace('<img', '<img onclick="openModal(this.src)" style="cursor:pointer;"', $row['info']);
        $markers[] = $row;
    }
    
    echo json_encode($markers);
}

$conn->close();
?>
