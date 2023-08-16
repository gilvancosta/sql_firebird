UPDATE  TBL_PESSOA SET
 TBL_PESSOA.DT_ULTIMA_COMPRA  = ( SELECT  MAX(TBL_PEDIDO.DATA_PEDIDO) FROM  TBL_PEDIDO WHERE  TBL_PEDIDO.ID_TBL_CLIENTE =  TBL_PESSOA.ID_TBL_PESSOA )
 WHERE
  TBL_PESSOA.ID_TBL_PESSOA = 51991;




--  Clientes
         SELECT
           TBL_PESSOA.DT_ULTIMA_COMPRA,
              TBL_PESSOA.ID_TBL_PESSOA,
             TBL_PESSOA.ID_PESSOA_TIPO, 
             TBL_PESSOA.NOME,
             TBL_PESSOA.FONE1,          
             TBL_PESSOA.FONE2,
             TBL_PESSOA.RESTRICAO,
             TBL_PESSOA.EMAIL_DE_LOGIN,     
             TBL_PESSOA.CPF,
             TBL_PESSOA.CNPJ
         FROM             
             TBL_PESSOA   

         WHERE                                            
          TBL_PESSOA.ID_SYSTEM_CLIENTE =  14
         AND
           TBL_PESSOA.DT_ULTIMA_COMPRA IS NULL