/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.astec.servlet;

import com.senac.astec.AbstracClass.CreatedTokenAbstract;
import com.senac.astec.BusinessRule.CreatedToken;
import com.senac.astec.dao.LoginDAO;
import com.senac.astec.model.Cliente;
import com.senac.astec.model.Funcionario;
import com.senac.astec.model.Imovel;
import com.senac.astec.model.Login;
import com.senac.astec.model.Token;
import com.senac.astec.service.ServicoCliente;
import com.senac.astec.service.ServicoFuncionario;
import com.senac.astec.service.ServicoImovel;
import com.senac.astec.service.ServicoLogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "consultarImoveis", urlPatterns = {"/consultar-imoveis"})
public class ConsultarImoveisServlet extends HttpServlet {

    private int imovelId = 0;

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

        doHead(request, response);

        System.out.println(request.getParameter("method"));
        HttpSession session = request.getSession(false);

        String tokenJwt = (String) session.getAttribute("token");

        CreatedTokenAbstract jwt = new CreatedToken();

        Token token = (Token) jwt.decodeToken(tokenJwt);
        
        if (token.getTipoLogin().equals("funcionario")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("Pages/EfetuarVenda.jsp");
            dispatcher.forward(request, response);
            return;
        }
        System.out.println("TOKEN DO CLIENTE " + token.getTipoLogin());
        String destino = "Pages/ConsultarImoveis.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
        dispatcher.forward(request, response);
    }

    // vai deletar um cliente
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CHAMOU O POST");
        String path = "Pages/ConsultarImoveis.jsp";
        doHead(request, response);
        System.out.println(request.getParameter("idImovel"));
        int imovelId = Integer.parseInt(request.getParameter("idImovel"));
        ServicoImovel servicoImovel = new ServicoImovel();
        System.out.println("CHAMOU AQUI");
        System.out.println(request.getParameter("salvar"));
        if (request.getParameter("salvar") != null) {
            System.out.println("AQUI CARAIO: " + request.getParameter("idImovel"));
            try {
            String nome = request.getParameter("nome");
            String cep = request.getParameter("cep");
            String logradouro = request.getParameter("logradouro");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String descricao = request.getParameter("descricao");
            int numDorm = Integer.parseInt(request.getParameter("numDorm"));
            double tamanho = Double.parseDouble(request.getParameter("tamanho"));
            int vagas = Integer.parseInt(request.getParameter("vagas"));
            int andar = Integer.parseInt(request.getParameter("andar"));
            String[] checkBoxMobiliado = request.getParameterValues("mobiliado");
            boolean mobiliado = false;
            if (checkBoxMobiliado[0] != null) {
                mobiliado = true;
            }
            String[] checkBoxPets = request.getParameterValues("pets");
            boolean pets = false;
            if (checkBoxPets.length > 0 && checkBoxPets[0] != null) {
                pets = true;
            }
            String tipoImovel = request.getParameter("tipoImovel");
            double valor = Double.parseDouble(request.getParameter("valor"));
            double condominio = Double.parseDouble(request.getParameter("condominio"));
            double iptu = Double.parseDouble(request.getParameter("iptu"));
            double seguro = Double.parseDouble(request.getParameter("seguro"));
            boolean parcelaImovel = false;
            String[] checkBoxParcela = request.getParameterValues("pets");
            if (checkBoxParcela.length > 0 && checkBoxParcela[0] != null) {
                parcelaImovel = true;
            }
            double valorEntrada = Double.parseDouble(request.getParameter("valorEntrada"));

                HttpSession session = request.getSession(false);

                String tokenJwt = (String) session.getAttribute("token");

                CreatedTokenAbstract jwt = new CreatedToken();

                Token token = (Token) jwt.decodeToken(tokenJwt);

                int idEmpresa = token.getIdEmpresa();
                System.out.println(token.getTipoLogin());
                System.out.println(token.getIdEmpresa());
                System.out.println("ID DA EMPRESA: " + token.getIdEmpresa());
                Imovel newImovel = new Imovel();
                newImovel.setNome(nome);
                newImovel.setCep(cep);
                newImovel.setLogradouro(logradouro);
                newImovel.setNumero(numero);
                newImovel.setComplemento(complemento);
                newImovel.setBairro(bairro);
                newImovel.setCidade(cidade);
                newImovel.setEstado(estado);
                newImovel.setDescricao(descricao);
                newImovel.setNumDormitorios(numDorm);
                newImovel.setTamanho(tamanho);
                newImovel.setVagas(vagas);
                newImovel.setAndar(andar);
                newImovel.setMobiliado(mobiliado);
                newImovel.setTipoImovel(tipoImovel);
                newImovel.setValor(valor);
                newImovel.setCondominio(condominio);
                newImovel.setPet(pets);
                newImovel.setIptu(iptu);
                newImovel.setSeguro(seguro);
                newImovel.setParcela(parcelaImovel);
                newImovel.setValorEntrada(valorEntrada);
                newImovel.setEnabled(true);
                newImovel.setCodigoempresa(idEmpresa);
                newImovel.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                System.out.println("AGORA FOI O ID? " + newImovel.getIdImovel());
                servicoImovel.atualizarImovel(newImovel);
            } catch (Exception ex) {
                System.out.println("ERRO AO EXCLUIR CLIENTE: " + ex);
            }
        } else if (request.getParameter("editar") != null) {
            try {
                System.out.println("ACHAR ESSE ID: " + imovelId);
                Imovel imovel = servicoImovel.procurarImovel(imovelId);
                System.out.println("ID DO IMOVEL EDITANDO " + imovel.getIdImovel());
                request.setAttribute("imovel", imovel);
                path = "Pages/EditarImovel.jsp";
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (request.getParameter("remover") != null) {
            try {
                System.out.println(imovelId);
                servicoImovel.excluirImovel(imovelId);
            } catch (Exception ex) {
                System.out.println("ERRO AO EXCLUIR CLIENTE: " + ex);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);

    }

}
