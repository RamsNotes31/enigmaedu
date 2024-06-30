<?php
include 'db.php';
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: ../index.html");
    exit;
}

$user = $_SESSION['user'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <?php include '../partials/header.php'; ?>

    <div class="container mt-5">
        <h2>Your Profile</h2>
        <p><strong>Username:</strong> <?php echo $user['Username']; ?></p>
        <p><strong>Email:</strong> <?php echo $user['Email']; ?></p>
        <p><strong>Role:</strong> <?php echo $user['Role']; ?></p>
        <p><strong>Name:</strong> <?php echo $user['Nama']; ?></p>
        <p><strong>Date of Birth:</strong> <?php echo $user['Tanggal_Lahir']; ?></p>
    </div>

    <?php include '../partials/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/script.js"></script>
</body>
</html>
