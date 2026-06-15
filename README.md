# Projeto de Banco de Dados — Clínica Veterinária

Este projeto apresenta a modelagem e implementação de um banco de dados para uma clínica veterinária fictícia. O objetivo é aplicar os conceitos de modelagem conceitual, lógica e física, além de demonstrar operações CRUD e consultas SQL com relacionamentos entre tabelas.

---

# Cenário

A clínica veterinária **PetVida** realiza atendimentos para animais, como cães e gatos. Para melhorar a organização das informações, a clínica precisa de um sistema de banco de dados capaz de armazenar dados sobre clientes, seus pets, veterinários, especialidades, consultas e vacinação.

Cada cliente pode possuir um ou mais pets cadastrados. Cada pet pertence a apenas um cliente. Os pets podem passar por várias consultas ao longo do tempo, sendo cada consulta realizada por um veterinário.

Os veterinários podem possuir uma ou mais especialidades, como clínica geral, dermatologia, cirurgia ou vacinação. Uma mesma especialidade também pode estar associada a vários veterinários, caracterizando um relacionamento muitos para muitos.

Além disso, a clínica precisa registrar os telefones dos clientes e dos veterinários. Como uma pessoa pode possuir mais de um telefone, esses dados foram separados em tabelas próprias.

Também é necessário controlar a carteira de vacinação dos pets, registrando as vacinas aplicadas, a data de aplicação e a data da próxima dose.

O banco de dados desenvolvido busca atender às principais necessidades da clínica, permitindo cadastrar, consultar, atualizar e excluir informações de forma organizada e segura.

---

# Modelagem Conceitual

Na modelagem conceitual, foram identificadas as principais entidades do sistema, seus atributos e os relacionamentos entre elas.

## Entidades identificadas

As principais entidades do projeto são:

- Cliente;
- Telefone Cliente;
- Pet;
- Carteira de Vacinação;
- Veterinário;
- Telefone Veterinário;
- Especialidade;
- Consulta.

## Entidade Cliente

A entidade `Cliente` representa os donos dos pets cadastrados na clínica.

Atributos:

- `id_cliente`: identificador único do cliente;
- `nome`: nome completo do cliente;
- `cpf`: CPF do cliente;
- `email`: e-mail do cliente;
- `data_nascimento`: data de nascimento;
- `rua`;
- `numero`;
- `bairro`;
- `cidade`;
- `estado`.

O endereço foi tratado como um atributo composto, sendo dividido em rua, número, bairro, cidade e estado.

## Entidade Telefone Cliente

A entidade `Telefone Cliente` representa os telefones dos clientes.

Atributos:

- `id_telefone_cliente`;
- `telefone`.

Essa entidade foi criada porque um cliente pode possuir mais de um telefone, caracterizando um atributo multivalorado.

## Entidade Pet

A entidade `Pet` representa os animais cadastrados na clínica.

Atributos:

- `id_pet`;
- `nome`;
- `especie`;
- `raca`;
- `sexo`;
- `idade`;
- `data_nascimento`;
- `peso`.

A idade do pet não precisa ser armazenada diretamente, pois pode ser calculada a partir da data de nascimento. Portanto, a idade é considerada um atributo derivado.

## Entidade Carteira de Vacinação

A entidade `Carteira de Vacinação` armazena os registros de vacinas aplicadas nos pets.

Atributos:

- `id_carteira`;
- `data_emissao`;
- `observacoes`.

Um pet pode possuir vários registros de vacinação.

## Entidade Veterinário

A entidade `Veterinário` representa os profissionais que realizam os atendimentos na clínica.

Atributos:

- `id_veterinario`;
- `nome`;
- `email`;
- `telefone`.

## Entidade Telefone Veterinário

A entidade `Telefone Veterinário` armazena os telefones dos veterinários.

Atributos:

- `id_telefone_veterinario`;
- `telefone`.

Essa entidade foi criada porque um veterinário pode possuir mais de um telefone.

## Entidade Especialidade

A entidade `Especialidade` representa as áreas de atuação dos veterinários.

Atributos:

- `id_especialidade`;
- `nome_especialidade`.

## Entidade Consulta

A entidade `Consulta` representa os atendimentos realizados na clínica.

Atributos:

- `id_consulta`;
- `data_consulta`;
- `motivo`;
- `diagnostico`;

Cada consulta está relacionada a um pet e a um veterinário.

## Relacionamentos

Os principais relacionamentos identificados foram:

````
Cliente 1:N Pet
Cliente 1:N Telefone Cliente
Pet 1:1 Carteira de Vacinação
Pet 1:N Consulta
Veterinário 1:N Telefone Veterinário
Veterinário 1:N Consulta
Veterinário 1:N Especialidade
````

##Modelagem Lógica

Na modelagem lógica, as entidades do modelo conceitual foram transformadas em tabelas relacionais.

Cada entidade passou a ser representada por uma tabela. Os atributos se tornaram colunas, e os relacionamentos foram representados por meio de chaves primárias e estrangeiras.

Tabelas do modelo lógico
As tabelas criadas foram:

cliente;
telefone_cliente;
pet;
carteira_vacinacao;
veterinario;
telefone_veterinario;
especialidade;
veterinario_especialidade;
consulta.
Estrutura lógica das tabelas
cliente
Tabela responsável por armazenar os dados dos clientes.


# Modelagem Lógica

Na modelagem lógica, as entidades do modelo conceitual foram transformadas em tabelas. Os atributos viraram colunas, e os relacionamentos foram representados por chaves primárias e estrangeiras.

---

## Tabelas

As tabelas definidas para o projeto são:

- `cliente`
- `telefone_cliente`
- `pet`
- `carteira_vacinacao`
- `veterinario`
- `telefone_veterinario`
- `especialidade`
- `veterinario_especialidade`
- `consulta`

---

## Estrutura das tabelas

```Cliente
cliente
- id_cliente PK
- nome
- cpf
- email
- data_nascimento
- rua
- numero
- bairro
- cidade
- estado
-cep
```

```Telefone_Cliente
telefone_cliente
- id_telefone_cliente PK
- id_cliente FK
- telefone
```

```Pet
pet
- id_pet PK
- id_cliente FK
- nome
- especie
- raca
- sexo
- data_nascimento
- peso
```

```Carteira_Vacinação
- id_carteira PK
- data_emissão
- observacoes
```

```Veterinário
- id_veterinario PK
- nome
- email
```

```Telefone_ Veterináriio
- id_telefone_veterinario PK
- id_veterinario FK
- telefone
```

```Especialidade
- id_especialidade PK
- nome_especialidade
```

```Veterinário Especialidade
- id_veterinario PK/FK
- id_especialidade PK/FK
```

```Consulta
- id_consulta PK
- id_pet FK
- id_veterinario FK
- data_consulta
- diagnostico
- observações
```

---

## Relacionamentos

```text
cliente 1:N pet
cliente 1:N telefone_cliente
pet 1:1 carteira_vacinacao
pet 1:N consulta
veterinario 1:N telefone_veterinario
veterinario 1:N consulta
veterinario N:N especialidade
```

---

## Observações

- Os telefones foram separados em tabelas próprias por serem atributos multivalorados.
- O endereço do cliente foi dividido em campos menores, representando um atributo composto.
- A idade do pet é um atributo derivado, calculado pela data de nascimento.
- As tabelas possuem chaves primárias e estrangeiras para garantir os relacionamentos.

==================================================================================================

# Banco de Dados — Clínica Veterinária

O banco foi desenvolvido com base na modelagem conceitual e lógica, representando clientes, pets, veterinários, especialidades, consultas, carteiras de vacinação e telefones.

---

## Estrutura dos arquivos SQL

Os scripts foram separados por tabela para facilitar a organização.

```text
001_cliente.sql
002_pet.sql
003_veterinario.sql
004_especialidade.sql
005_consulta.sql
006_carteira_vacinacao.sql
007_telefone_cliente.sql
008_telefone_veterinario.sql
009_veterinario_especialidade.sql
```

---

## Tabelas criadas

O banco de dados possui as seguintes tabelas:

| Tabela | Finalidade |
|---|---|
| `cliente` | Armazena os dados dos tutores dos pets |
| `pet` | Armazena os dados dos animais cadastrados |
| `veterinario` | Armazena os dados dos veterinários |
| `especialidade` | Armazena as especialidades dos veterinários |
| `consulta` | Registra as consultas realizadas |
| `carteira_vacinacao` | Registra as observações dos veterinários aos pets |
| `telefone_cliente` | Armazena os telefones dos clientes |
| `telefone_veterinario` | Armazena os telefones dos veterinários |
| `veterinario_especialidade` | Relaciona veterinários e especialidades |

---

## Relacionamentos do banco

O banco possui os seguintes relacionamentos principais:

```text
cliente 1:N pet
cliente 1:N telefone_cliente
pet 1:N consulta
pet 1:1 carteira_vacinacao
veterinario 1:N consulta
veterinario 1:N telefone_veterinario
veterinario N:N especialidade
```
---

## Tipos de atributos representados

O projeto contempla diferentes tipos de atributos utilizados na modelagem de banco de dados:

| Tipo de atributo | Exemplo no projeto |
|---|---|
| Atributo chave | `id_cliente`, `id_pet`, `id_veterinario` |
| Atributo simples | `nome`, `email`, `cpf`, `crmv` |
| Atributo composto | Endereço do cliente, dividido em rua, número, bairro, cidade e estado |
| Atributo multivalorado | Telefones de clientes e veterinários |
| Atributo derivado | Idade do pet, calculada a partir da data de nascimento |

---

## CRUD

A pasta `CRUD` contém evidências das operações básicas realizadas no banco de dados.

Foram demonstradas as operações:

```text
CREATE
READ
UPDATE
DELETE
```

Os testes de CRUD foram realizados utilizando a tabela `especialidade`.

Arquivos apresentados:

```text
01 Create - Especialidade.png
02 Read - Especialidade.png
03 Update - Especialidade.png
04 Delete - Especialidade.png
```

---

## Testes e consultas

A pasta `Testes` contém prints das consultas SQL executadas para validar o funcionamento do banco de dados.

As consultas demonstram:

- listagem de consultas por espécie do pet;
- busca de consultas realizadas por veterinário;
- listagem de pets por nome;
- consultas com diagnóstico;
- consultas com observações;
- consultas em determinada data;
- contagem de consultas por veterinário;
- listagem de pets com seus respectivos tutores;
- listagem de consultas com dados de pet, cliente e veterinário.

Esses testes comprovam o funcionamento dos relacionamentos entre as tabelas.

---

## Considerações finais

O banco de dados foi organizado de forma relacional, respeitando o uso de chaves primárias, chaves estrangeiras e tabelas intermediárias.

A estrutura permite cadastrar clientes, pets, veterinários, especialidades, consultas, telefones e registros de vacinação, atendendo aos requisitos propostos.




