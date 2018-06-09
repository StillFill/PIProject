<%@page import="java.sql.Timestamp"%>
<%@page import="com.senac.astec.model.Relatorio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.senac.astec.utils.ConexaoBanco"%>
<%@page import="com.senac.astec.service.ServicoCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://127.0.0.1:3306/imobiliaria"
                   user="root"  password=""/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Styles/Consultas.css">
        <link rel="stylesheet" type="text/css" href="Styles/Geral.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <meta charset="utf-8">
        <title>Relatorio</title>
    </head>
    <style>
        body {
            margin: 0;
        }
        .consulta-header {
            display:flex;
            justify-content: space-around;
            background-color: rgba(0,0,0,0.2);
        }

        .header-item {
            padding: 1em;
            flex: 1;
            text-align: center;
            border: 1px solid rgba(0,0,0,0.3);
        }

        .data-row {
            display: flex;
            justify-content: space-around;
        }

        .data-item {
            text-align: center;
            padding: 0.3em 0;
            border: 1px solid rgba(0,0,0,0.1);
            flex: 1;
        }
        #remover-alerta {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            padding: 1em;
        }
        #alerta-container {
            display: none;
        }
        .drop-down {
            width: 100%;
        }
        #clientes-container {
            display: none;
            position: absolute;
            width: 100%;
            background-color: grey;
            color: white;
        }
        .principal-navbar {
            display: flex;
            background-color: white;
        }
                .drop-down {
            width: 100%;
        }
        #clientes-container {
            display: none;
            position: absolute;
            width: 20vw;
            padding: 0 1em;
            background-color: grey;
            color: white;
        }
        #funcionarios-container {
            display: none;
            position: absolute;
            width: 20vw;
            padding: 0 1em;
            background-color: grey;
            color: white;
        }
        #imoveis-container {
            display: none;
            position: absolute;
            width: 20vw;
            padding: 0 1em;
            background-color: grey;
            color: white;
        }
        .principal-navbar {
            display: flex;
            background-color: white;
        }
        .navItem {
            width: 20vw;
        }

        .drop-item {
            padding: 1em 0;
            cursor: pointer;
            width: 100%;
            text-align: center;
            text-transform: uppercase;
        }
    </style>
    <script>
        function pushTo(route) {
            window.location.pathname = route;
        }
        var selectedClientId = 0;
        function setClienteId(id) {
            if (id === '0') {
                document.getElementById('alerta-container').style.display = "none";
            } else {
                document.getElementById('alerta-container').style.display = "block";
            }
            document.getElementById('clienteId').value = id;
        }
        function showClienteOptions() {
            if (document.getElementById('clientes-container').style.display === 'block') {
                document.getElementById('clientes-container').style.display = 'none';
            } else {
                document.getElementById('clientes-container').style.display = 'block';
            }
        }
        function showFuncionarioOptions() {
            if (document.getElementById('funcionarios-container').style.display === 'block') {
                document.getElementById('funcionarios-container').style.display = 'none';
            } else {
                document.getElementById('funcionarios-container').style.display = 'block';
            }
        }
        function showImovelOptions() {
            if (document.getElementById('imoveis-container').style.display === 'block') {
                document.getElementById('imoveis-container').style.display = 'none';
            } else {
                document.getElementById('imoveis-container').style.display = 'block';
            }
        }
    </script>
    <body>
        <form method="post" action="http://10.135.143.12:8080/astec/relatorio">
            <input type="hidden" name="clienteId" value="0" id="clienteId">
            <div class="principal-navbar">
                <div class="drop-down">
                    <div class="navItem" onclick="showClienteOptions()">Clientes</div>
                    <div id="clientes-container">
                        <div onClick="pushTo('astec/cadastrar-cliente')" class="drop-item">Cadastrar</div>
                        <div class="drop-item">Consultar</div>
                    </div>
                </div>
                <div class="drop-down">
                    <div class="navItem" onclick="showFuncionarioOptions()">Funcionarios</div>
                    <div id="funcionarios-container">
                        <div onClick="pushTo('astec/cadastrar-funcionario')" class="drop-item">Cadastrar</div>
                        <div onClick="pushTo('astec/consultar-funcionarios')" class="drop-item">Consultar</div>
                    </div>
                </div>
                <div class="drop-down">
                    <div class="navItem" onclick="showImovelOptions()">Imoveis</div>
                    <div id="imoveis-container">
                        <div onClick="pushTo('astec/cadastrar-imovel')" class="drop-item">Cadastrar</div>
                        <div onClick="pushTo('astec/consultar-imoveis')" class="drop-item">Consultar</div>
                    </div>
                </div>
                <div class="drop-down">
                    <div class="navItem" onClick="pushTo('astec/relatorio')">Relatório</div>
                </div>
                <button type='button' onClick="pushTo('astec/login')">Sair</button>
            </div>
            <div>
                <div class="consulta-header">
                    <div class="header-item"><b>Data</b></div>
                    <div class="header-item"><b>Cliente</b></div>
                    <div class="header-item"><b>Vendedor</b></div>
                    <div class="header-item"><b>Imovel</b></div>
                    <div class="header-item"><b>Pago</b></div>
                </div>
                <%
                    try {
                        ArrayList<Relatorio> relatorios = (ArrayList<Relatorio>) request.getSession().getAttribute("relatorios");
                        for(int i = 0; i < relatorios.size(); i++){
                            Relatorio relatorio = relatorios.get(i);
                            Timestamp data = relatorio.getData();
                            String cliente = relatorio.getNomeCliente();
                            String vendedor = relatorio.getNomeFuncionario();
                            String imovel = relatorio.getNomeImovel();
                            double valor = relatorio.getValor();
                %>
                <div class="data-row" bgcolor="#DEB887">

                    <div class="data-item"><%=data%></div>
                    <div class="data-item"><%=cliente%></div>
                    <div class="data-item"><%=vendedor%></div>
                    <div class="data-item"><%=imovel%></div>
                    <div class="data-item"><%=valor%></div>
                </div>

                <%
                    }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </form>
    </body>
</html>
