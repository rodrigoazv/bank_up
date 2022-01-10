# BankUp

Um sistema capaz de representar criação de contas e transações bancárias válidas

# Como rodar

Com o docker instalado, basta rodar um ``docker-compose up``.

localhost:4000 - phoenix api
localhost:80   - pgadmin
localhost:5432 - postgres

# Requisitos Funcionais

- [x] Criar conta
- [x] Fazer login e gerar JWT
- [ ] Utilizar o jwt para realizar as autenticacoes
- [x] Deposito
- [x] Saque
- [x] Transacao
- [ ] Salvar transacao
- [ ] Desfazer transacao

# Endpoints e objetos ( Documentacao )

> Account_id pode ser obtido por uma query no pgadmin apos insercao de usuarios

> SELECT * FROM accounts;


>post http://localhost:4000/api/users
>
>>{
>>	"firstName": "paulo",
>>	"lastName": "Azevedo",
>>	"cpf": "0120122021220",
>>	"password": "123123123",
>>	"nickname": "paulo"
>>}


>post http://localhost:4000/api/users/sign_in
>
>>{
>>	"nickname": "rodrigo",
>>	"password": "123123123"
>>}


>post http://localhost:4000/api/auth/account/:account_id/deposit
>>{
>>	"value": "100"
>>}



>post http://localhost:4000/api/auth/account/:account_id/withdraw
>>{
>>	"value": "100"
>>}



>post http://localhost:4000/api/auth/account/transaction
>>{
>>	"from": "53552886-5c7a-41c8-bbe4-4897194d1d2d",
>>	"to": "6bed22b6-4bd9-43c6-9bd4-0dd93e844f89",
>>	"value": "1"
>>}
