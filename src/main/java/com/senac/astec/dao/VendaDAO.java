/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.dao;

import com.senac.astec.model.Venda;
import com.senac.astec.utils.ConexaoBanco;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VendaDAO {
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
        
    public Integer inserirVenda(Venda venda){
                 String query = "INSERT INTO vendas (idImovel, idFuncionario, idCliente, idEmpresa, valor, dataCriacao) values (?,?,?,?,?,?)";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, venda.getIdImovel());
            preparedStatement.setInt(2,venda.getIdFuncionario());
            preparedStatement.setInt(3,venda.getIdCliente());
            preparedStatement.setInt(4,venda.getIdEmpresa());
            preparedStatement.setDouble(5,venda.getValor());
            preparedStatement.setTimestamp(6, venda.getDataCriacao());
            
            preparedStatement.executeUpdate();            
            ResultSet  rs = preparedStatement.getGeneratedKeys();
            rs.next();
            int codigo = rs.getInt(1);
            preparedStatement.close();

            return codigo;
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar venda");
            return null;
        }
    }
    
     public ArrayList<Venda> listarVendas(int codigoempresa) throws Exception{
         String query = "SELECT * from vendas WHERE idEmpresa=?";
         ArrayList<Venda> listadevendas = new ArrayList<>();
         System.out.println("CODIGO EMPRESA: " + codigoempresa);
         if (codigoempresa == 0) {
              query = "SELECT * from vendas";
              try {
                PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    Venda venda = new Venda();
                    venda.setIdVenda(rs.getInt(1));
                    venda.setIdFuncionario(rs.getInt(2));
                    venda.setIdCliente(rs.getInt(3));
                    venda.setIdImovel(rs.getInt(4));
                    venda.setIdEmpresa(rs.getInt(5));
                    venda.setValor(rs.getDouble(6));
                    venda.setDataCriacao(rs.getTimestamp(7));
                    listadevendas.add(venda);
                }
                  System.out.println("ACHOU AQUI?: " + listadevendas.size());
                return listadevendas;
              }catch(SQLException ex) {
                  System.out.println("ERRO AO LISTAR TODAS AS VENDAS: " + ex);
              }
         }
         
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setInt(1, codigoempresa);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                Venda venda = new Venda();
                venda.setIdVenda(rs.getInt(1));
                venda.setIdFuncionario(rs.getInt(2));
                venda.setIdCliente(rs.getInt(3));
                venda.setIdImovel(rs.getInt(4));
                venda.setIdEmpresa(rs.getInt(5));
                venda.setValor(rs.getDouble(6));
                venda.setDataCriacao(rs.getTimestamp(7));
                listadevendas.add(venda);
            }
            return listadevendas;
        } catch (SQLException ex) {
            System.out.println("ERRO LITANDO VENDAS: " + ex);
        }
        return null;
    }
}
