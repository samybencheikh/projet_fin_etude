<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Connexion à la base de données
    $conn = new mysqli("localhost", "root", "", "atrssh");

    if ($conn->connect_error) {
        die("Échec de la connexion : " . $conn->connect_error);
    }

    // Vérifier les informations de connexion
    $sql = "SELECT * FROM agents_traitants WHERE email = ? LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();

        // Comparaison directe du mot de passe (PAS SÉCURISÉ, mais tu ne veux pas de hash)
        if ($password === $row['password']) {
            $_SESSION['traitantID'] = $row['traitantID'];
            $_SESSION['nom'] = $row['nom_prénoms_agent_traitant'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['type'] = $row['type'];

            // Redirection après connexion réussie
            header("Location: dashboard.php");// hadi mnb3ad nbadloha  
            exit();
        } else {
            $error = "Mot de passe incorrect.";
        }
    } else {
        $error = "Email non trouvé.";
    }
        // login gir ta3 agents bimafihom admin mazal labo ou membres 
    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - ATRSSH</title>
    <link rel="stylesheet" href="login.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

    <div class="container">
        <div class="login-section">
            <div class="form-box login">
                <form action="" method="POST">
                    <div class="login-header">
                        <img src="images/Logo.png" alt="Logo ATRSSH" class="login-logo">
                        <p class="logo">Plateforme de l'ATRSSH</p>
                    </div>

                    <h2>Connexion</h2>

                    <?php if (isset($error)) { ?>
                        <p style="color: red; text-align: center;"><?= htmlspecialchars($error) ?></p>
                    <?php } ?>

                    <div class="input-box">
                        <span class="icon"><i class="bx bxs-envelope"></i></span>
                        <input type="email" name="email" required>
                        <label for="email">E-mail</label>
                    </div>

                    <div class="input-box">
                        <span class="icon"><i class="bx bxs-lock-alt"></i></span>
                        <input type="password" name="password" required>
                        <label for="password">Mot de passe</label>
                    </div>

                    <div class="remember-password">
                        <label><input type="checkbox"> Se souvenir de moi</label>
                        <a href="password.html">Mot de passe oublié ?</a>
                    </div>

                    <button class="btn">Se Connecter</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
