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
        <title>Consultar Imoveis</title>
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
        var selectedImovelId = 0;
        function setImovelId(id) {
            alert(id);
            if (id === '0') {
                document.getElementById('alerta-container').style.display = "none";
            } else {
                document.getElementById('alerta-container').style.display = "block";
            }
            document.getElementById('idImovel').value = id;
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
    </script>
    <body>
        <form method="post" action="http://localhost:8080/astec/consultar-imoveis">
            <input type="hidden" name="idImovel" value="0" id="idImovel">
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
                    <div class="navItem" onClick="pushTo('astec/cadastrar-cliente')">Vendas</div>
                </div>
                <div class="drop-down">
                    <div class="navItem" onClick="pushTo('astec/cadastrar-cliente')">Relatório</div>
                </div>
            </div>
            <%
                Connection connection;
                Statement statement = null;
                ResultSet resultSet = null;
                connection = ConexaoBanco.createConnection();
            %>
            <div>
                <div class="consulta-header">
                    <div class="header-item"><b>Nome</b></div>
                    <div class="header-item"><b>Tamanho</b></div>
                    <div class="header-item"><b>Vagas</b></div>
                    <div class="header-item"><b>Andar</b></div>
                    <div class="header-item"><b>Estado</b></div>
                    <div class="header-item"></div>
                </div>
                <%
                    try {
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM imovel where enabled = 1";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                            int id = resultSet.getInt("idImovel");
                            String nome = resultSet.getString("nome");
                            String tamanho = resultSet.getString("tamanho");
                            String vagas = resultSet.getString("vagas");
                            String andar = resultSet.getString("andar");
                            String estado = resultSet.getString("estado");
                %>
                <div class="data-row" bgcolor="#DEB887">

                    <div class="data-item"><%=nome%></div>
                    <div class="data-item"><%=tamanho%></div>
                    <div class="data-item"><%=vagas%></div>
                    <div class="data-item"><%=andar%></div>
                    <div class="data-item"><%=estado%></div>
                    <div style="cursor: pointer;" onclick="setImovelId('<%=id%>')" type="button" data-toggle="modal" data-target="#myModal" class="data-item"><i class="fa fa-trash"></i></div>
                </div>

                <%
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            <div id="alerta-container">
                <div id="remover-alerta">
                    <div><b>O que deseja fazer com este Imovel?</b></div>
                    <div>
                        <button type="submit" name="editar" value="Something">Editar</button>
                        <button type="submit" name="remover" value="Something else">Remover</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
