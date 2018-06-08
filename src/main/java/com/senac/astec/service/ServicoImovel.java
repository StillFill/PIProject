/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.service;
import com.senac.astec.dao.ImovelDAO;
import com.senac.astec.model.Imovel;
import java.io.IOException;
import java.util.List;
//Classe de Servico de Imovel
public class ServicoImovel {
    ImovelDAO produtoDAO = new ImovelDAO();
    
    public void cadastrarImovel(Imovel produto) throws IOException {
        
        

        try {
            //Realiza a chamada de inserção na fonte de dados
            produtoDAO.inserirImovel(produto);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            System.out.println("ERRO AO INSERIR" + e);
        }
    }

    //Atualiza um produto na fonte de dados
    public void atualizarImovel(Imovel imovel) throws IOException {
        

        try {
            produtoDAO.updateImovel(imovel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public  Imovel procurarImovel(int idImovel) throws IOException {
        try {
        return produtoDAO.encontrarImovel(idImovel);
          
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            return null;
        }
    }

    public void excluirImovel(int codigo) throws IOException {
        try {
            produtoDAO.deletarImovel(codigo);
        } catch (Exception e) {
            System.out.println("Erro " + e);
        }
    }
}
