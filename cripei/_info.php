<pre><?php print_r($_SERVER )?></pre>
/* MOSTRA AS INFORMAÇÕES DO PC E TRABALHO. COM ['DOCUMENT_ROOT'] ADICIONADO ENTRE
OS PARÊNTESES, MOSTRA O CAMINHO DO HOST PARA A PASTA DO TRABALHO. */ 

<?php phpinfo() ?> mostra todas as informações do servidor.

require($_SERVER['DOCUMENT_ROOT'] . '/_footer.php'); 