<?php
include 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Hash the password
    $hashed_password = hash('sha256', $password);

    // Check user credentials
    $sql = "SELECT * FROM User WHERE Username='$username' AND Password='$hashed_password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Save user data in session
        $_SESSION['user'] = $result->fetch_assoc();
        header("Location: dashboard.php");
    } else {
        echo "Invalid username or password.";
    }
}
?>
