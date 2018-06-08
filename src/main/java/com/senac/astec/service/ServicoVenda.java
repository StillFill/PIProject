/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.service;

import com.senac.astec.dao.VendaDAO;
import com.senac.astec.model.Venda;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class ServicoVenda {
    public static List<Venda> listaVendas = new ArrayList<>();
    VendaDAO vendaDAO = new VendaDAO();
    
    //Insere um Produto na fonte de dados
    public Integer inserirVenda(Venda venda) throws IOException {
        try {
            return vendaDAO.inserirVenda(venda);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
        //Retorna Carrinho
   public ArrayList<Venda> listarVendas(int codigoempresa) throws IOException, Exception{
        
        try {
            return vendaDAO.listarVendas(codigoempresa);
            //return vendaDAO.(codigocarrinho);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
