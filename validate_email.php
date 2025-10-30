<?php
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

// Ejemplo de uso
$email = 'test@example.com';
if (validateEmail($email)) {
    echo "El correo electrónico es válido.";
} else {
    echo "El correo electrónico no es válido.";
}
?>