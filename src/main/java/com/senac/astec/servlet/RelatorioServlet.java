/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.servlet;

import com.google.gson.JsonObject;
import com.senac.astec.AbstracClass.CreatedTokenAbstract;
import com.senac.astec.BusinessRule.CreatedToken;
import com.senac.astec.dao.LoginDAO;
import com.senac.astec.model.Cliente;
import com.senac.astec.model.Funcionario;
import com.senac.astec.model.Imovel;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.senac.astec.model.Login;
import com.senac.astec.model.Relatorio;
import com.senac.astec.model.Token;
import com.senac.astec.model.Venda;
import com.senac.astec.service.ServicoCliente;
import com.senac.astec.service.ServicoFuncionario;
import com.senac.astec.service.ServicoImovel;
import com.senac.astec.service.ServicoVenda;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dev
 */
@WebServlet(name = "Relatorio Servlet", urlPatterns = {"/relatorio"})
public class RelatorioServlet extends HttpServlet {

    protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            req.getRequestDispatcher("Pages/Login.jsp").forward(req, resp);
        }

        if (session.getAttribute("token") == null) {
            req.getRequestDispatcher("Pages/Login.jsp").forward(req, resp);
        }

        String token = (String) session.getAttribute("token");
        //instanciando classe responsavel pelo token
        CreatedTokenAbstract jwt = new CreatedToken();
        //analisando token
        if (!jwt.codificarToken(token)) {
            resp.setStatus(resp.SC_FORBIDDEN);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CHAMOU O GET");
        doHead(request, response);

        System.out.println(request.getParameter("method"));
        HttpSession session = request.getSession(false);

        String tokenJwt = (String) session.getAttribute("token");

        CreatedTokenAbstract jwt = new CreatedToken();

        Token token = (Token) jwt.decodeToken(tokenJwt);

        ServicoVenda servicoVenda = new ServicoVenda();
        ServicoCliente servicoCliente = new ServicoCliente();
        ServicoImovel servicoImovel = new ServicoImovel();
        ServicoFuncionario servicoFuncionario = new ServicoFuncionario();
        try {
            ArrayList<Relatorio> relatorios = new ArrayList<Relatorio>();
            ArrayList<Venda> vendas = new ArrayList<Venda>();
            if (!token.getTipoLogin().equals("admin")) {
                vendas = servicoVenda.listarVendas(token.getIdEmpresa());
            } else {
                vendas = servicoVenda.listarVendas(0);
            }
            System.out.println("tem quantas? " + vendas.size());
            for (int i = 0; i < vendas.size(); i++) {
                Relatorio relatorio = new Relatorio();
                Venda venda = vendas.get(i);
                Cliente cliente = servicoCliente.procurarCliente(venda.getIdCliente());
                Funcionario funcionario = servicoFuncionario.procurarFuncionario(venda.getIdFuncionario());
                Imovel imovel = servicoImovel.procurarImovel(venda.getIdImovel());
                relatorio.setData(venda.getDataCriacao());
                relatorio.setNomeCliente(cliente.getNome());
                relatorio.setNomeFuncionario(funcionario.getNome());
                relatorio.setNomeImovel(imovel.getNome());
                relatorio.setValor(imovel.getValor());
                relatorios.add(relatorio);
            }
            session.setAttribute("relatorios", relatorios);
        } catch(Exception e) {
            System.out.println("erro ao listar relatorio: " + e);
        }
        String destino = "Pages/Relatorio.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }
}
