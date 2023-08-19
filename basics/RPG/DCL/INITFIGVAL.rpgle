        dcl-ds var_xtrm;                            
          chr0      char(10)        inz;        
          chr1      char(10)        inz(*loval);
          chr2      char(10)        inz(*hival);
          vch0      varchar(10)     inz;        
          vch1      varchar(10)     inz(*loval);
          vch2      varchar(10)     inz(*hival);
          gph0      graph(10)       inz;        
          gph1      graph(10)       inz(*loval);
          gph2      graph(10)       inz(*hival);
          ucs0      ucs2(10)        inz;        
          ucs1      ucs2(10)        inz(*loval);
          ucs2      ucs2(10)        inz(*hival);
          vgp0      vargraph(10)    inz;        
          vgp1      vargraph(10)    inz(*loval);
          vgp2      vargraph(10)    inz(*hival);
          vuc0      varucs2(10)     inz;        
          vuc1      varucs2(10)     inz(*loval);
          vuc2      varucs2(10)     inz(*hival);
          ind0      ind             inz;        
          ind1      ind             inz(*on);   
          ind2      ind             inz(*off);  
          uns0      uns(3)          inz;        
          uns1      uns(3)          inz(*loval);
          uns2      uns(3)          inz(*hival);
          int0      int(3)          inz;        
          int1      int(3)          inz(*loval);
          int2      int(3)          inz(*hival);
          pck0      packed(5:2)     inz;        
          pck1      packed(5:2)     inz(*loval);
          pck2      packed(5:2)     inz(*hival);
          zon0       zoned(5:2)     inz;        
          zon1       zoned(5:2)     inz(*loval);
          zon2       zoned(5:2)     inz(*hival);
          bdc0      bindec(5)       inz;        
          bdc1      bindec(5)       inz(*loval);
          bdc2      bindec(5)       inz(*hival);
          flt0       float(8)       inz;        
          flt1       float(8)       inz(*loval);
          flt2       float(8)       inz(*hival);
          ptr0       pointer        inz;        
          ptr1       pointer        inz(*NULL); 
          dte0       date           inz;        
          dte1       date           inz(*loval);
          dte2       date           inz(*hival);
          tim0       time           inz;        
          tim1       time           inz(*loval);
          int0      int(3)          inz;        
          int1      int(3)          inz(*loval);
          int2      int(3)          inz(*hival);
          pck0      packed(5:2)     inz;        
          pck1      packed(5:2)     inz(*loval);
          pck2      packed(5:2)     inz(*hival);
          zon0       zoned(5:2)     inz;        
          zon1       zoned(5:2)     inz(*loval);
          zon2       zoned(5:2)     inz(*hival);
          bdc0      bindec(5)       inz;        
          bdc1      bindec(5)       inz(*loval);
          bdc2      bindec(5)       inz(*hival);
          flt0       float(8)       inz;        
          flt1       float(8)       inz(*loval);
          flt2       float(8)       inz(*hival);
          ptr0       pointer        inz;        
          ptr1       pointer        inz(*NULL); 
          dte0       date           inz;        
          dte1       date           inz(*loval);
          dte2       date           inz(*hival);
          tim0       time           inz;        
          tim1       time           inz(*loval);
          tim2       time           inz(*hival);
          tsp0       timestamp      inz;        
          tsp1       timestamp      inz(*loval);
          tsp2       timestamp      inz(*hival);
        end-ds;                                     
> EVAL var_xtrm                                                                
   CHR0 OF VAR_XTRM = '          '                                              
   CHR1 OF VAR_XTRM = '          '                                              
   CHR2 OF VAR_XTRM = '██████████'                                              
   VCH0 OF VAR_XTRM = '          '                                              
   VCH1 OF VAR_XTRM = '          '                                              
   VCH2 OF VAR_XTRM = '██████████'                                              
   GPH0 OF VAR_XTRM = '                      '                                  
   GPH1 OF VAR_XTRM = '                      '                                  
   GPH2 OF VAR_XTRM = ' ████████████████████ '                                  
   UCS0 OF VAR_XTRM =                                                           
   UCS1 OF VAR_XTRM =                                                           
   UCS2 OF VAR_XTRM = ██████████                                                
   VGP0 OF VAR_XTRM = '                      '                                  
   VGP1 OF VAR_XTRM = '                      '                                  
   VGP2 OF VAR_XTRM = ' ████████████████████ '                                  
   VUC0 OF VAR_XTRM =                                                           
   VUC1 OF VAR_XTRM =                                                           
   VUC2 OF VAR_XTRM = ██████████                                                
   IND0 OF VAR_XTRM = '0'                                                       
   IND1 OF VAR_XTRM = '1'                                                       
   IND2 OF VAR_XTRM = '0'                                                       
   UNS0 OF VAR_XTRM = 0                                                         
   UNS1 OF VAR_XTRM = 0                                                         
   UNS2 OF VAR_XTRM = 255                                                       
   INT0 OF VAR_XTRM = 0                                                         
   INT1 OF VAR_XTRM = -128                                                      
   INT2 OF VAR_XTRM = 127                                                       
   PCK0 OF VAR_XTRM = 000.00                                                    
   PCK1 OF VAR_XTRM = -999.99                                                   
   PCK2 OF VAR_XTRM = 999.99                                                    
   ZON0 OF VAR_XTRM = 000.00                                                    
   ZON1 OF VAR_XTRM = -999.99                                                   
   ZON2 OF VAR_XTRM = 999.99                                                    
   BDC0 OF VAR_XTRM = 00000.                                                    
   BDC1 OF VAR_XTRM = -99999.                                                   
   BDC2 OF VAR_XTRM = 99999.                                                    
   FLT0 OF VAR_XTRM =   0.000000000000E+000                                     
   FLT1 OF VAR_XTRM =  -1.797693134862E+308                                     
   FLT2 OF VAR_XTRM =   1.797693134862E+308                                     
   PTR0 OF VAR_XTRM = SPP:*NULL                                                 
   PTR1 OF VAR_XTRM = SPP:*NULL                                                 
   DTE0 OF VAR_XTRM = '0001-01-01'                                              
   DTE1 OF VAR_XTRM = '0001-01-01'                                              
   DTE2 OF VAR_XTRM = '9999-12-31'                                              
   TIM0 OF VAR_XTRM = '00.00.00'                                                
   TIM1 OF VAR_XTRM = '00.00.00'                                                
   TIM2 OF VAR_XTRM = '24.00.00'                                                
   TSP0 OF VAR_XTRM = '0001-01-01-00.00.00.000000'                              
   TSP1 OF VAR_XTRM = '0001-01-01-00.00.00.000000'                              
   TSP2 OF VAR_XTRM = '9999-12-31-24.00.00.000000'                              

