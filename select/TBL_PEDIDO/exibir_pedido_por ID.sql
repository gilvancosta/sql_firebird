SELECT                                               
    -- *-- PEDIDO --*/
    TBL_PEDIDO.ID_TBL_PEDIDO,
    (  SELECT COUNT(ID_TBL_PEDIDO_MOVIMENTO ) FROM TBL_PEDIDO_MOVIMENTO WHERE TBL_PEDIDO_MOVIMENTO.ID_TBL_PEDIDO =  TBL_PEDIDO.ID_TBL_PEDIDO) AS QT_ITENS_PEDIDO,   
    (   SELECT SUM((   TBL_PEDIDO_MOVIMENTO.QT * (  ( TBL_PEDIDO_MOVIMENTO.VL_UNITARIO + TBL_PEDIDO_MOVIMENTO.VL_ACRESCIMO + TBL_PEDIDO_MOVIMENTO.VL_SEGURO  ) -   
    ( TBL_PEDIDO_MOVIMENTO.VL_DESCONTO + TBL_PEDIDO_MOVIMENTO.VL_DESCONTO_ADM) ))  
    +  ( TBL_PEDIDO_MOVIMENTO.VL_FRETE  ) )                                                                        
    FROM TBL_PEDIDO_MOVIMENTO WHERE TBL_PEDIDO_MOVIMENTO.ID_TBL_PEDIDO =  TBL_PEDIDO.ID_TBL_PEDIDO) AS VL_TOTAL,
    TBL_PEDIDO.ID_LOJA,                               
    TBL_PEDIDO.ID_DEPARTAMENTO,                       
    TBL_PEDIDO.ID_TBL_CLIENTE,                        
    TBL_PEDIDO.ID_TBL_VENDEDOR,                       
    -- *-- AGENTES --*/
    TBL_CLIENTE.NOME          AS NOMEDOCLIENTE,
    TBL_VENDEDOR.NOME         AS NOMEDOVENDEDOR,
    TBL_LOCALIZACAO.DESCRICAO AS LOCATION,
    TBL_PEDIDO.ID_PG_FORMA,                           
    -- *-- STATUS --*/
    TBL_PEDIDO.ID_STATUS_ORCAMENTO,                   
    TBL_PEDIDO.ID_STATUS_PEDIDO,                      
    TBL_PEDIDO.ID_STATUS_ENTREGA,                     
    TBL_PEDIDO.ID_STATUS_ESTOQUE,                     
    TBL_PEDIDO.ID_STATUS_FINANCEIRO,                  
    TBL_PEDIDO.FLAG_VENDA_ATACADO,                    
    
    TBL_STATUS_PEDI.STATUS     AS STATUS_PEDIDO,
    TBL_STATUS_FINC.STATUS     AS STATUS_FINANCEIRO,
    TBL_PEDIDO.EQUIPAMENTO,                           
    TBL_PEDIDO.ID_STATUS_OS,                          
    TBL_PEDIDO.STATUS_OS,                             
    -- *-- CORREIOS --*/
    TBL_PEDIDO.ID_TIPO_FRETE,                         
    TBL_PEDIDO.ID_FORMATO_ENVIO,                      
    TBL_PEDIDO.PRAZO_ENTREGA_DIA,                     
    TBL_PEDIDO.QT_VOLUME,                             
    TBL_PEDIDO.CODIGO_CORREIOS,                       
    TBL_PEDIDO.VL_FRETE_ENTREGA,                      
    TBL_PEDIDO.PESO_FRETE_GR,                         
    TBL_PEDIDO.DATAENVIO_FRETE,                       
    TBL_PEDIDO.DATAENTREGA_FRETE,                     
    -- *-- VALORES --*/
    TBL_PEDIDO.VL_FRETE,                              
    TBL_PEDIDO.CODIGOP,                               
    TBL_PEDIDO.TX_DESCONTO_CODP,                      
    TBL_PEDIDO.VL_DESCONTO,                           
    
    TBL_PEDIDO.NFE_CHAVE,                             
    TBL_PEDIDO.NFE_LOTE,                              
    TBL_PEDIDO.NFE_NUMERO,                            
    TBL_PEDIDO.NFE_OPERACAO,                          
    TBL_PEDIDO.NFE_CHAVE_DEVOLUCAO,                   
    TBL_PEDIDO.NFSE,                                  
    -- *-- DATAS --*/
    TBL_PEDIDO.DATA_ORCAMENTO,                        
    TBL_PEDIDO.DATA_PEDIDO,                           
    TBL_PEDIDO.DATA_VENDA,                            
    TBL_PEDIDO.DATA_ENTREGA,                          
    TBL_PEDIDO.DATA,                                  
    TBL_PEDIDO.HORA,                                  
    TBL_PEDIDO.DATADOCADASTRO                         
FROM                                                  
    TBL_PEDIDO                                        
INNER JOIN  TBL_STATUS  TBL_STATUS_PEDI  ON TBL_STATUS_PEDI.ID_TBL_STATUS         = TBL_PEDIDO.ID_STATUS_PEDIDO
INNER JOIN  TBL_STATUS  TBL_STATUS_FINC  ON TBL_STATUS_FINC.ID_TBL_STATUS         = TBL_PEDIDO.ID_STATUS_FINANCEIRO
INNER JOIN  TBL_PESSOA  AS TBL_VENDEDOR  ON TBL_VENDEDOR.ID_TBL_PESSOA            = TBL_PEDIDO.ID_TBL_VENDEDOR
LEFT JOIN   TBL_PESSOA  AS TBL_CLIENTE   ON TBL_CLIENTE.ID_TBL_PESSOA             = TBL_PEDIDO.ID_TBL_CLIENTE
INNER JOIN  TBL_LOCALIZACAO              ON TBL_LOCALIZACAO.ID_TBL_LOCALIZACAO    = TBL_PEDIDO.ID_LOCALIZACAO_PED
WHERE
    TBL_PEDIDO.ID_SYSTEM_CLIENTE = 14
AND
    ( TBL_PEDIDO.DATA  BETWEEN ( current_date - 180)  AND  current_date + 1)
-- AND TBL_PEDIDO.id_loja =  13
AND
    TBL_PEDIDO.ID_TBL_PEDIDO =  1166690