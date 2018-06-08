/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.service;

import com.senac.astec.dao.FuncionarioDAO;
import com.senac.astec.model.Funcionario;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author msgre
 */
public class ServicoFuncionario {
    FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    
    public int cadastrarFuncionario(Funcionario funcionario) throws IOException, Exception {


        try {
           int insertedId = funcionarioDAO.inserirFuncionario(funcionario);
            System.out.println("NOVO ID: " + insertedId);
           return insertedId;
        } catch (Exception e) {
            System.out.println("ERRO AO CADASTRAR FUNCIONARIO: " + e);
        }
        return 0;
    }
    
    public ArrayList<Funcionario> listarFuncionarios(int codigoempresa) throws IOException, Exception {
        try {
            return funcionarioDAO.listarFuncionarios(codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            return null;
        }
    }
    
    //Atualiza um cliente na fonte de dados
    public void atualizarFuncionario(Funcionario funcionario) throws IOException, Exception {
        
        //ValidadorCliente.validar(cliente);

        try {
            System.out.println(funcionario.getIdFuncionario());
            funcionarioDAO.updateFuncionario(funcionario);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Funcionario procurarFuncionario(int id) throws IOException, Exception {
        try {
            return funcionarioDAO.encontrarFuncionarioPorId(id);
        } catch (Exception e) {
            System.out.println("EROR AO PROCURAR CLIENTE: "+ e);
            return null;
        }
    }
    
    //Exclui o cliente com ID informado do mock
    public void excluirFuncionario(int idFuncionario) throws IOException, Exception {
        try {
            //Solicita ao DAO a exclusão do cliente informado
            funcionarioDAO.deletarFuncionario(idFuncionario);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            
        }
    }
}
