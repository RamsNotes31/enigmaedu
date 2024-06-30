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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <?php include '../partials/header.php'; ?>

    <div class="container mt-5">
        <h1 class="text-center">Welcome, <?php echo $user['Nama']; ?></h1>
        <div class="row mt-4">
            <div class="col-md-6">
                <h2>Your Profile</h2>
                <p><strong>Username:</strong> <?php echo $user['Username']; ?></p>
                <p><strong>Email:</strong> <?php echo $user['Email']; ?></p>
                <p><strong>Role:</strong> <?php echo $user['Role']; ?></p>
            </div>
            <div class="col-md-6">
                <h2>Dashboard</h2>
                <ul>
                    <li><a href="manage_users.php">Manage Users</a></li>
                    <li><a href="manage_classes.php">Manage Classes</a></li>
                    <li><a href="manage_materials.php">Manage Materials</a></li>
                    <li><a href="manage_assignments.php">Manage Assignments</a></li>
                    <li><a href="manage_quizzes.php">Manage Quizzes</a></li>
                </ul>
            </div>
        </div>
    </div>

    <?php include '../partials/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/script.js"></script>
</body>
</html>
