<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Set content type
header('Content-Type: application/json');

// Include the shared DB connection
require_once 'conexao.php';
$con->set_charset("utf8");

// Get JSON input
$jsonParam = json_decode(file_get_contents('php://input'), true);

if (!$jsonParam) {
    echo json_encode(['success' => false, 'message' => 'Dados JSON inválidos ou ausentes.']);
    exit;
}

// Extract and validate data
$idNome     = trim($jsonParam['idNome'] ?? '');
$idEmail    = trim($jsonParam['idEmail'] ?? '');
$idProtocoo = isset($jsonParam['idProtocoo']) ? intval($jsonParam['idProtocoo']) : null;
$idProjeto  = intval($jsonParam['idProjeto'] ?? 0);



// Prepare and bind
$stmt = $con->prepare("
    INSERT INTO usuario (idNome, idEmail, idProtocoo, idProjeto)
    VALUES (?, ?, ?, ?)
");

if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Erro ao preparar a consulta: ' . $con->error]);
    exit;
}

$stmt->bind_param("ssii", $idNome, $idEmail, $idProtocoo, $idProjeto);

// Execute and return result
if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Usuário inserido com sucesso!']);
} else {
    echo json_encode(['success' => false, 'message' => 'Erro no registro do usuário: ' . $stmt->error]);
}

$stmt->close();
$con->close();

?>
