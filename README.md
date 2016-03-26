# LBAW-OnlineAuction
Repositório do prjeto de LBAW

#Link para as entregas:

https://docs.google.com/document/d/1XDBde204pqRrU-pbS7Y7-1v1WnLFJwatQJ6yz1_8uQs/edit

#O que falta alterar:

-ter uma tabela chamada pagamentos onde vais guardar (em situacao da vida real)
user_id
total_value
order_id
payment_token
payment_confirmation
method
algo assim
fora um ID proprio 

-basicamente vais guardar o user, o que ele pagou, o valor e dois campos (token e confirmation) que vem do provider de pagamentos (paypal, easypay, google wallet, whateveR)

-as categorias podem estar vazias, por isso deves por a ligacao 0..* com o produto
e, mais cedo ou mais tarde, vais apanhar o mesmo produto em varias categorias
eu nao limitaria isso

-que nao faz sentido que o cancelado, aberto, etc seja hierarquia do estado, alias
fica demasiado detalhado
é terrivelmente complexo de implementar e nao tem vantagem nenhuma


-as mensagens escusam de ser uma tabela pendurada
faz me mais sentido que seja uma classe por merito proprio
ligada aos users
com sender_id e recipient_id
