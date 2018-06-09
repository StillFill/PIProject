<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="Styles/Login.css">
	<link rel="stylesheet" type="text/css" href="Styles/Cadastros.css">
        <link rel="stylesheet" type="text/css" href="Styles/Geral.css">
	<meta charset="utf-8">
	<title>Cadastro de Imóveis</title>
</head>
<script type="text/javascript">
 function pushTo(){
    window.location.pathname = "/astec/cadastrar-cliente";
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
<style>
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
        #imoveis-container {
            display: none;
            position: absolute;
            width: 20vw;
            padding: 0 1em;
            background-color: grey;
            color: white;
        }
</style>
<body>
    <div class="principal-navbar">
                <div class="drop-down">
                    <div class="navItem" onclick="showClienteOptions()">Clientes</div>
                    <div id="clientes-container">
                        <div onClick="pushTo('astec/cadastrar-cliente')" class="drop-item">Cadastrar</div>
                        <div onClick="pushTo('astec/consultar-clientes')" class="drop-item">Consultar</div>
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
    <form method="post" action="http://10.135.143.12:8080/astec/cadastrar-imovel">
        <div class="application-container">
		<div class="form-container">
			<div class="form-header">CADASTRO DE IMÓVEIS</div>
			<div class="form-content">
				<div class="form-block">
				<label>Nome:</label>
				<input type="text" name="nome">
				<label>CEP:</label>
				<input type="text" name="cep">
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
				<label>Descrição:</label>
				<input type="text" name="descricao">
			</div>
			<div class="form-block-row">
				<div>
					<p>Nº Dorm:</p>
					<input class="spinner" type="number" name="numDorm">
				</div>
				<div>
					<p>Tamanho:</p>
					<input type="text" name="tamanho">
				</div>
				<div>
					<p>Vagas:</p>
					<input class="spinner" type="number" name="vagas">
				</div>
			</div>
			<div class="form-block">
				<label>Andar:</label>
				<input type="text" name="andar">
				<label>Mobiliado:</label>
				<input type="checkbox" name="mobiliado" value="sim">Sim
				<label>Aceita pets:</label>
				<input type="checkbox" name="pets" value="sim">Sim
			</div>
			<div class="form-block">
                            <label>Aluguel/Compra:</label>
                                <div class="radio-container">
                                    <input type="radio" name="tipoImovel" value="aluguel"> <span style="margin-right: 0.5em">Aluguel</span>
                                    <input type="radio" name="tipoImovel" value="venda">Venda
                                </div>
  				<label>Valor:</label>
				<input type="text" name="valor">
				<label>Condominio:</label>
				<input type="text" name="condominio">
				<label>IPTU:</label>
				<input type="text" name="iptu">
				<label>Seguro:</label>
				<input type="text" name="seguro">
				<label>Parcela:</label>
                                <div class="radio-container">
                                    <input type="radio" name="parcelaImovel" value="sim"> <span style="margin-right: 0.5em">Sim</span>
                                    <input type="radio" name="parcelaImovel" value="nao">Não
                                </div>
  				<label>Valor da entrada:</label>
				<input type="text" name="valorEntrada">
				
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
