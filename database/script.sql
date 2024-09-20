CREATE TABLE ContaDeUsuario (
    ID_Conta VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(50),
    DataDeNascimento DATE,
    Email VARCHAR(50) UNIQUE,
    Rua VARCHAR(50),
    Bairro VARCHAR(50),
    Cidade VARCHAR(20)
);

CREATE TABLE Telefone (
    ID INT PRIMARY KEY,
    CPF_Usuario VARCHAR(11),
    Numero VARCHAR(20),
    FOREIGN KEY (CPF_Usuario) REFERENCES ContaDeUsuario(ID_Conta)
);

CREATE TABLE Medico (
    CRM_Medico VARCHAR(6) PRIMARY KEY,
	CPF_Medico VARCHAR(11),
    Especialidade VARCHAR(20),
    FOREIGN KEY (CPF_Medico) REFERENCES ContaDeUsuario(ID_Conta)
);

CREATE TABLE Paciente (
    CPF_Paciente VARCHAR(11) PRIMARY KEY,
	FOREIGN KEY (CPF_Paciente) REFERENCES ContaDeUsuario(ID_Conta)
);

CREATE TABLE Prontuario (
    ID_Prontuario INT PRIMARY KEY,
    CRM_Medico VARCHAR(6),
	CPF_Paciente VARCHAR(11),
    Data DATE,
    Prescricao VARCHAR(100),
    Diagnostico VARCHAR(100),
    FOREIGN KEY (CRM_Medico) REFERENCES Medico(CRM_Medico),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente)
);

CREATE TABLE Exame (
    ID_Exame INT PRIMARY KEY,
    ID_Prontuario INT,
    Resultado VARCHAR(100),
	Nome_Exame VARCHAR(100),
    FOREIGN KEY (ID_Prontuario) REFERENCES Prontuario(ID_Prontuario)
);

CREATE TABLE Agendamento (
    ID_Agendamento INT PRIMARY KEY,
    CPF_Paciente VARCHAR(11),
    CRM_Medico VARCHAR(6),
    DataHora TIMESTAMP,
    TipoConsulta VARCHAR(20),
    FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente),
    FOREIGN KEY (CRM_Medico) REFERENCES Medico(CRM_Medico)
);

CREATE TABLE Pagamento (
    ID INT PRIMARY KEY,
    CPF_Paciente VARCHAR(11),
    Data DATE,
    Valor DECIMAL(10, 2),
	FOREIGN KEY (CPF_Paciente) REFERENCES Paciente(CPF_Paciente)
);


--INSERÇÕES
-- POVOAMENTO DO BANCO DE DADOS
-- Inserção de dados na tabela de ContaDeUsuario
INSERT INTO ContaDeUsuario 
VALUES (10000000001, 'João Silva', '1999-01-01', 'joao@gmail.com', 'Rua São João', 'Centro', 'São Paulo'),
       (20000000002, 'Maria Santos', '2002-02-02', 'maria@gmail.com', 'Rua São Paulo', 'Zona Sul', 'São Paulo'),
       (30000000003, 'José Pereira', '1987-03-03', 'jose@hotmail.com', 'Rua São Pedro', 'Zona Norte', 'São Paulo'),
       (40000000004, 'Ana Souza', '1969-04-04', 'ana@hotmail.com', 'Rua Rui Maia', 'Centro', 'Quixadá'),
       (50000000005, 'Carlos Oliveira', '2010-05-05', 'carlos@yahoo.com', 'Rua São Francisco', 'Alto', 'Quixadá'),
       (60000000006, 'Natan Rodrigues', '2001-06-08', 'natan@gmail.com', 'Rua Nossa Senhora dos Remédios', 'Benfica', 'Fortaleza'),
       (70000000007, 'Vitória Lima', '2004-11-23', 'vit@gmail.com', 'Rua Marechal Deodoro', 'Centro', 'Fortaleza'),
       (80000000008, 'Rafaela Lima', '1998-12-25', 'rafa@yahoo.com', 'Rua São José', 'Centro', 'Fortaleza'),
       (90000000009, 'Caio Lemos', '2000-07-07', 'caio@hotmail.com', 'Rua Portugal', 'Botafogo', 'Rio de Janeiro'),
       (10000000010, 'Yuri Xavier', '2003-08-08', 'xavier@yahoo.com', 'Rua Ipanema', 'Copacabana', 'Rio de Janeiro'),
	   (11000000000, 'Dr. Joãozinho', '1999-01-01', 'joaojao@gmail.com', 'Rua São João', 'Centro', 'São Paulo'),
       (12000000000, 'Dra. Maria Nucita', '2002-02-02', 'marianucita@gmail.com', 'Rua São Paulo', 'Zona Sul', 'São Paulo'),
       (13000000000, 'Dr. José Ceará', '1987-03-03', 'josecearence@hotmail.com', 'Rua São Pedro', 'Zona Norte', 'São Paulo'),
       (14000000000, 'Dra. Aninha', '1969-04-04', 'anaaninha@hotmail.com', 'Rua Rui Maia', 'Centro', 'Quixadá'),
       (15000000000, 'Dr. Carlos Gesso', '2010-05-05', 'caarlosss@yahoo.com', 'Rua São Francisco', 'Alto', 'Quixadá'),
       (16000000000, 'Dr. Natan Azambuja', '2001-06-08', 'nnnnatan@gmail.com', 'Rua Nossa Senhora dos Remédios', 'Benfica', 'Fortaleza'),
       (17000000000, 'Dr. Vitória Vitoriosa', '2004-11-23', 'vitoria@gmail.com', 'Rua Marechal Deodoro', 'Centro', 'Fortaleza'),
       (18000000000, 'Dra. Rafaela Rafinha', '1998-12-25', 'rafaa@yahoo.com', 'Rua São José', 'Centro', 'Fortaleza'),
       (19000000000, 'Dr. Caio Caiado', '2000-07-07', 'caiooo@hotmail.com', 'Rua Portugal', 'Botafogo', 'Rio de Janeiro'),
       (20000000000, 'Dr. Monica Pequenote', '2003-08-08', 'monica@yahoo.com', 'Rua Ipanema', 'Copacabana', 'Rio de Janeiro');
	   
-- Inserção de dados na tabela Medico
INSERT INTO Medico
VALUES (100001, 11000000000, 'Cardiologista'),
       (200002, 12000000000, 'Dermatologista'),
       (300003, 13000000000, 'Endocrinologista'),
       (400004, 14000000000, 'Ginecologista'),
       (500005, 15000000000, 'Neurologista'),
       (600006, 16000000000, 'Oftalmologista'),
       (700007, 17000000000, 'Ortopedista'),
       (800008, 18000000000, 'Oncologista'),
       (900009, 19000000000, 'Psiquiatra'),
       (100010, 20000000000, 'Urologista');
	   
-- Inserção de dados na tabela Paciente
INSERT INTO Paciente
VALUES (10000000001),
	   (20000000002),
	   (30000000003),
	   (40000000004),
	   (50000000005),
	   (60000000006),
	   (70000000007),
	   (80000000008),
	   (90000000009),
	   (10000000010);
	   
-- Inserção de dados na tabela Telefone
INSERT INTO Telefone
VALUES (1, 10000000001, '11999999999'),
       (2, 20000000002, '11999999998'),
       (3, 30000000003, '11999945997'),
       (4, 40000000004, '88994912999'),
       (5, 50000000005, '88999908698'),
       (6, 60000000006, '85999908959'),
       (7, 70000000007, '85996799388'),
       (8, 80000000008, '85991239997'),
       (9, 90000000009, '21994412399'),
       (10,10000000010, '21999646498');
	   
-- Inserção de dados na tabela Prontuario
INSERT INTO Prontuario
VALUES (1, 100001, 10000000001, '2021-01-01', 'Realizar exame físico', 'Paciente com dor no peito'),
       (2, 200002, 20000000002, '2012-02-15', 'Creme tópico para eczema', 'Dermatite atópica'),
       (3, 300003, 30000000003, '2010-03-10', 'Metformina 500mg', 'Diabetes tipo 2'),
       (4, 400004, 40000000004, '2005-04-05', 'Exame de Papanicolau', 'Prevenção do câncer de colo de útero'),
       (5, 500005, 50000000005, '2024-05-20', 'Ressonância magnética', 'Cefaleia crônica'),
       (6, 600006, 60000000006, '2019-06-12', 'Gota de colírio', 'Conjuntivite alérgica'),
       (7, 700007, 70000000007, '2020-07-25', 'Fisioterapia', 'Lesão no ligamento cruzado anterior'),
       (8, 800008, 80000000008, '2008-08-10', 'Quimioterapia', 'Câncer de pulmão'),
       (9, 900009, 90000000009, '2018-09-22', 'Antidepressivo', 'Depressão maior'),
       (10, 100010, 10000000010, '2024-10-15', 'Ultrassonografia', 'Cálculo renal');	
	   
-- Inserção de dados na tabela Exame
INSERT INTO Exame
VALUES (1, 1, 'Normal', 'Eletrocardiograma'),
    (2, 2, 'Confirma dermatite atópica', 'Biopsia de pele'),
    (3, 3, 'Elevada', 'Glicemia de jejum'),
    (4, 4, 'Normal', 'Colposcopia'),
    (5, 5, 'Alterações sugestivas de migrânea', 'Ressonância magnética cerebral'),
    (6, 6, 'Positivo para pólen', 'Teste alérgico'),
    (7, 7, 'Ruptura do ligamento cruzado anterior', 'Ressonância magnética do joelho'),
    (8, 8, 'Múltiplas lesões sugestivas de metástases', 'Tomografia computadorizada de tórax'),
    (9, 9, 'Sem evidência de metástases', 'Tomografia por emissão de pósitrons (PET-CT)'),
    (10, 10, 'Cálculo renal no rim direito', 'Ultrassonografia abdominal');

-- Inserção de dados na tabela Agendamento
INSERT INTO Agendamento
VALUES (1, 10000000001, 100001, '2021-01-01 08:30:00', 'Videochamada'),
       (2, 20000000002, 200002, '2012-02-15 09:10:00', 'Via telefone'),
       (3, 30000000003, 300003, '2010-03-10 07:00:00', 'Videochamada'), 
       (4, 40000000004, 400004, '2005-04-05 12:40:00', 'Via telefone'),
       (5, 50000000005, 500005, '2024-05-20 12:30:00', 'Videochamada'),
       (6, 60000000006, 600006, '2019-06-12 13:00:00', 'Via telefone'),
       (7, 70000000007, 700007, '2020-07-25 14:20:00', 'Videochamada'),
       (8, 80000000008, 800008, '2008-08-10 15:30:00', 'Via telefone'),
       (9, 90000000009, 900009, '2018-09-22 16:50:00', 'Videochamada'),
       (10, 10000000010, 100010, '2024-10-15 17:20:00', 'Via telefone');

-- Inserção de dados na tabela Pagamento
INSERT INTO Pagamento
VALUES (1, 10000000001, '2021-01-01', 100.00),
       (2, 20000000002, '2012-02-15', 150.00),
       (3, 30000000003, '2010-03-10', 200.00),
       (4, 40000000004, '2005-04-05', 250.00),
       (5, 50000000005, '2024-05-20', 300.00),
       (6, 60000000006, '2019-06-12', 350.00),
       (7, 70000000007, '2020-07-25', 400.00),
       (8, 80000000008, '2008-08-10', 450.00),
       (9, 90000000009, '2018-09-22', 500.00),
       (10, 10000000010, '2024-10-15', 550.00);
