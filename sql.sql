CREATE TABLE IF NOT EXISTS Arvores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    condicao TEXT NOT NULL,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Relatorios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    arvore_id INTEGER NOT NULL,
    observacao TEXT NOT NULL,
    data_relatorio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (arvore_id) REFERENCES Arvores(id)
);

INSERT INTO Arvores (nome, latitude, longitude, condicao) VALUES
('Ipê Amarelo', -23.5505, -46.6333, 'Saudável'),
('Jacarandá', -23.5550, -46.6400, 'Doente'),
('Figueira', -23.5600, -46.6300, 'Risco de Queda');

INSERT INTO Relatorios (arvore_id, observacao) VALUES
(1, 'Árvore saudável e bem cuidada'),
(2, 'Folhas amareladas, possível praga detectada'),
(3, 'Rachadura no tronco, risco de queda em dias de chuva');
