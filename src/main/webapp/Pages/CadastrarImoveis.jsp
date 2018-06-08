<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="Styles/Login.css">
	<link rel="stylesheet" type="text/css" href="Styles/Cadastros.css">
	<meta charset="utf-8">
	<title>Cadastro de Imóveis</title>
</head>
<script type="text/javascript">
 function pushTo(){
    window.location.pathname = "/astec/cadastrar-cliente";
 }
</script>
<style>
    .form-block label{
    margin-top: 1em;
}
.radio-container {
    display: flex;
    margin-top: 0.3em;
}

.radio-container input {
    margin-left: 0;
}

.form-block-row {
    padding-left: 0.5em;
}
.form-block-row p{
    padding-left: 0.5em;
}
</style>
<body>
    <form method="post" action="http://localhost:8080/astec/cadastrar-imovel">
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
