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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATRSS</title>
    <link rel="stylesheet" href="login.css">
    <link rel="shortcut icon" type="image/x-icon" href="images/Logo.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <!-- LOGIN FORM CREATION -->
    <div class="background"></div>
    <div class="container">
        <div class="item">
            <h2 class="logo"><i class='bx bxl-xing'></i> ATRSSH</h2>
            <div class="text-item">
                <h2>Bienvenue sur la plateforme de &nbspl'ATRSSH</h2>
                <p>Plateforme de L'Agence Thématique de Recherche en Sciences Humaines et Sociales</p>
                <div class="social-icon">
                    <a href="https://m.facebook.com/ATRSSH/?locale=fr_FR" target="_blank"><i class='bx bxl-facebook'></i></a>
                    <a href="#" target="_blank"><i class='bx bxl-twitter'></i></a>
                    <a href="#" target="_blank"><i class='bx bxl-youtube'></i></a>
                    <a href="#" target="_blank"><i class='bx bxl-instagram'></i></a>
                    <a href="https://dz.linkedin.com/in/atrssh-dz-207904224" target="_blank"><i class='bx bxl-linkedin'></i></a>
                </div>
                
                
            </div>
        </div>
        <div class="login-section">
            <div class="form-box login">
                <form action="">
                    <div class="login-header">
                        <img src="images/Logo.png" alt="Logo ATRSSH" class="login-logo">
                        <p class="logo">Platforme de L'ATRSSH</p>
                        <p class="login-text"></p>
                    </div>
                    
                    <style>
                        .login-header {
                            text-align: center;
                            margin-bottom: 20px;
                        }
                    
                        .login-logo {
                            width: 80px; /* Adjust logo size */
                            height: auto;
                            border-radius: 8px; /* Optional rounded corners */
                        }
                    
                    </style>
                    
                   
                    <h2>Connexion</h2>
                    <?php if (isset($error)) { ?>
                        <p style="color: red; text-align: center;"><?= htmlspecialchars($error) ?></p>
                    <?php } ?>
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope'></i></span>
                        <input type="email" id="email" required name="email">
                        <label for="email">e-mail ou nom de l'utilisateur</label>
                    </div>
                    
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt'></i></span>
                        <input type="password" id="password" required name="password">
                        <label for="password">Mot de passe</label>
                    </div>
                    
                    <div class="remember-password">
                        <label for=""><input type="checkbox">Se souvenir de moi</label>
                        <a href="password.html">Mot de passe oublié ?</a>
                    </div>
                    <button class="btn">Se Connecter</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
