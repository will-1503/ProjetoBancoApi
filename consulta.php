<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Inclui o script de conexão
require_once 'conexao.php';
$con->set_charset("utf8");

// Consulta todos os registros da nova tabela 'usuario'
$sql = "SELECT idUsuario, idNome, idEmail, idProtocoo, idProjeto FROM usuario";

$result = $con->query($sql);

$response = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $response[] = array_map(fn($val) => mb_convert_encoding($val, 'UTF-8', 'ISO-8859-1'), $row);
    }
} else {
    // Retorno padrão caso não haja registros
    $response[] = [
        "idUsuario" => 0,
        "idNome" => "",
        "idEmail" => "",
        "idProtocoo" => null,
        "idProjeto" => 0
    ];
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($response);

$con->close();

?>
