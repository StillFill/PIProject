<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Styles/Cadastros.css">
        <link rel="stylesheet" type="text/css" href="Styles/Login.css">
        <link rel="stylesheet" type="text/css" href="Styles/Geral.css">
        <meta charset="utf-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
        <title>Cadastro de Filial</title>
    </head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#cnpj').mask('00.000.000/0000-00');
            $('#cep').mask('00000-000');
        });
    </script>
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
    </script>
    <body>
                 <div class="principal-navbar">
            <div class="drop-down">
                    <div class="navItem" onClick="pushTo('astec/cadastrar-empresa')">Filial</div>
                </div>
                <div class="drop-down">
                    <div class="navItem" onClick="pushTo('astec/relatorio')">Relatório</div>
                </div>
                     <button type='button' onClick="pushTo('astec/login')">Sair</button>
            </div>
        <form method="post" action="http://10.135.143.12:8080/astec/cadastrar-empresa">
            <div class="application-container">
                <div class="form-container">
                    <div class="form-header">CADASTRO FILIAL</div>
                    <div class="form-content">
                        <div class="form-block">
                            <label>Nome:</label>
                            <input type="text" name="nome">
                            <label>CNPJ</label>
                            <input type="text" name="cnpj" id="cnpj">
                            <label>CEP:</label>
                            <input type="text" name="cep" id="cep">
                            <label>Logradouro:</label>
                            <input type="text" name="logradouro">
                            <label>Número:</label>
                            <input type="text" name="numero">
                            <label>Complemento:</label>
                            <input type="text" name="complemento">					
                            <label>Bairro:</label>
                            <input type="text" name="bairro">
                            <label>Cidade:</label>
                            <input type="text" name="cidade">
                            <label>Estado:</label>
                            <input type="text" name="estado">
                        </div>
                        <div class="form-block">
                            <h3>INFORMAÇÕES DE LOGIN</h3>
                            <label>Login:</label>
                            <input type="text" name="login">
                            <label>Senha:</label>
                            <input type="text" name="senha">
                        </div>
                    </div>
                    <div class="form-button">
                        <button>Salvar</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
