<?php
include 'db.php';
session_start();

if (!isset($_SESSION['user']) || $_SESSION['user']['Role'] != 'Guru') {
    header("Location: ../index.html");
    exit;
}

$guruID = $_SESSION['user']['UserID'];

$sql = "SELECT * FROM Tugas WHERE GuruID=$guruID";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Assignments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <?php include '../partials/header.php'; ?>

    <div class="container mt-5">
        <h2>Manage Assignments</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>TugasID</th>
                    <th>Judul</th>
                    <th>Deskripsi</th>
                    <th>Batas Waktu</th>
                    <th>KelasID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row['TugasID']; ?></td>
                    <td><?php echo $row['Judul']; ?></td>
                    <td><?php echo $row['Deskripsi']; ?></td>
                    <td><?php echo $row['Batas_Waktu']; ?></td>
                    <td><?php echo $row['KelasID']; ?></td>
                    <td>
                        <a href="edit_assignment.php?id=<?php echo $row['TugasID']; ?>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="delete_assignment.php?id=<?php echo $row['TugasID']; ?>" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

    <?php include '../partials/footer.php'; ?>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/script.js"></script>
</body>
</html>
