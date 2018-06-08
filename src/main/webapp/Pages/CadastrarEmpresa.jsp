<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Styles/Cadastros.css">
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
    <body>
        <form method="post" action="http://localhost:8080/astec/cadastrar-empresa">
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
