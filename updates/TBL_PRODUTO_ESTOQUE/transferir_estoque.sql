-- Cuidado com o ID pedido em mais de um loca e com a nomeclatura da loja de destino

UPDATE  TBL_PRODUTO_ESTOQUE SET            
   TBL_PRODUTO_ESTOQUE.ESTOQUE_LOJA13 =
  TBL_PRODUTO_ESTOQUE.ESTOQUE_LOJA13 + ( SELECT  TBL_PEDIDO_MOVIMENTO.QT  FROM  TBL_PEDIDO_MOVIMENTO
                                         WHERE   TBL_PEDIDO_MOVIMENTO.ID_TBL_PEDIDO  = 1152750
                                      AND     TBL_PEDIDO_MOVIMENTO.ID_TBL_PRODUTO = TBL_PRODUTO_ESTOQUE.ID_PRODUTO  ) 
WHERE                                    
    TBL_PRODUTO_ESTOQUE.ID_SYSTEM_CLIENTE   =  14
AND EXISTS (                                       
            SELECT                                 
                TBL_PEDIDO_MOVIMENTO.ID_TBL_PEDIDO_MOVIMENTO,         
                TBL_PEDIDO_MOVIMENTO.ID_TBL_PRODUTO ,                 
               TBL_PEDIDO_MOVIMENTO.QT                                
          FROM                                                        
                TBL_PEDIDO_MOVIMENTO                                  
          WHERE                                                       
             TBL_PEDIDO_MOVIMENTO.ID_SYSTEM_CLIENTE = 14
           AND                                                        
                TBL_PEDIDO_MOVIMENTO.ID_TBL_PEDIDO  = 1152750
           AND                                                        
                TBL_PEDIDO_MOVIMENTO.QT > 0                           
           AND                                                        
                TBL_PEDIDO_MOVIMENTO.ID_TBL_PRODUTO =   TBL_PRODUTO_ESTOQUE.ID_PRODUTO    
             );                                                        




UPDATE TBL_PEDIDO SET                                            
TBL_PEDIDO.DT_TRANFERENCIA        = current_date,

TBL_PEDIDO.ID_STATUS_PEDIDO       = 74,
TBL_PEDIDO.ID_STATUS_FINANCEIRO   = 17,

TBL_PEDIDO.STATUS_PEDIDO          = 'ENTRADA',
TBL_PEDIDO.STATUS_FINANCEIRO      = 'TRANSFERENCIA'

WHERE                                                            
TBL_PEDIDO.id_system_cliente   =  14
AND                                                              
TBL_PEDIDO.ID_TBL_PEDIDO          = 1152750 ;



-- verificar se existe nulos no estoque

SELECT
    TBL_PRODUTO_ESTOQUE.ID_PRODUTO,
    TBL_PRODUTO_ESTOQUE.ESTOQUE_LOJA13
FROM
    TBL_PRODUTO_ESTOQUE
WHERE
    TBL_PRODUTO_ESTOQUE.ID_SYSTEM_CLIENTE = 14
AND
    TBL_PRODUTO_ESTOQUE.ESTOQUE_LOJA13 IS NULL;