<?php
include 'db.php';
session_start();

if (!isset($_SESSION['user']) || $_SESSION['user']['Role'] != 'Guru') {
    header("Location: ../index.html");
    exit;
}

$guruID = $_SESSION['user']['UserID'];

$sql = "SELECT * FROM Quiz WHERE GuruID=$guruID";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Quizzes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
</head>
<body>
    <?php include '../partials/header.php'; ?>

    <div class="container mt-5">
        <h2>Manage Quizzes</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>QuizID</th>
                    <th>Judul</th>
                    <th>Deskripsi</th>
                    <th>KelasID</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo $row['QuizID']; ?></td>
                    <td><?php echo $row['Judul']; ?></td>
                    <td><?php echo $row['Deskripsi']; ?></td>
                    <td><?php echo $row['KelasID']; ?></td>
                    <td>
                        <a href="edit_quiz.php?id=<?php echo $row['QuizID']; ?>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="delete_quiz.php?id=<?php echo $row['QuizID']; ?>" class="btn btn-danger btn-sm">Delete</a>
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
