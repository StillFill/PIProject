    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.service;
import com.senac.astec.dao.ClienteDAO;
import com.senac.astec.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
//Classe de servico do cliente
public class ServicoCliente {
     ClienteDAO clienteDAO = new ClienteDAO();
     

    public void cadastrarCliente(Cliente cliente) throws IOException, Exception {

        try {
            clienteDAO.inserirCliente(cliente);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Atualiza um cliente na fonte de dados
    public void atualizarCliente(Cliente cliente) throws IOException, Exception {
        
        //ValidadorCliente.validar(cliente);

        try {
            clienteDAO.updateCliente(cliente);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Realiza a pesquisa de um cliente por nome na fonte de dados
    public Cliente procurarCliente(int id) throws IOException, Exception {
        try {
            return clienteDAO.encontrarClientePorId(id);
        } catch (Exception e) {
            System.out.println("EROR AO PROCURAR CLIENTE: "+ e);
            return null;
        }
    }
    public void excluirCliente(int idCliente) throws IOException, Exception {
        try {
            //Solicita ao DAO a exclusão do cliente informado
            clienteDAO.deletarCliente(idCliente);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            
        }
    }
   
    public ArrayList<Cliente> listarClientes(int codigoempresa) throws IOException, Exception {
        try {
            return clienteDAO.listarClientes(codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            return null;
        }
    }
    
        //Lista produtos de determinada empresa
    public List<Cliente> listarclientestotais() throws IOException, Exception {
        try {
            return clienteDAO.listarClientestotais();
            
        } catch (Exception e) {
            e.printStackTrace();
            
            return null;
        }
    }
}
