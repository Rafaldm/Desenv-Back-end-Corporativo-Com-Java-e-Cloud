<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cadastroee.model.Produto"%>

<!DOCTYPE html>
<html>
<head>
    <title>Dados do Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container">

<h2 class="my-4">Dados do Produto</h2>

<%
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = "incluir";

    if (produto != null) {
        acao = "alterar";
    }
%>

<form action="ServletProdutoFC" method="post" class="form">

    <input type="hidden" name="acao" value="<%=acao%>">

    <% if (produto != null) { %>
        <input type="hidden" name="id" value="<%=produto.getId()%>">
    <% } %>

    <!-- Campo Nome -->
    <div class="mb-3">
        <label for="nome" class="form-label">Nome:</label>
        <input type="text" name="nome" id="nome" 
               value="<%= produto != null ? produto.getNome() : "" %>" 
               class="form-control">
    </div>

    <!-- Campo Quantidade -->
    <div class="mb-3">
        <label for="quantidade" class="form-label">Quantidade:</label>
        <input type="number" name="quantidade" id="quantidade" 
               value="<%= produto != null ? produto.getQuantidade() : "" %>" 
               class="form-control">
    </div>

    <!-- Campo Preço de Venda -->
    <div class="mb-3">
        <label for="precoVenda" class="form-label">Preço de Venda:</label>
        <input type="text" name="precoVenda" id="precoVenda" 
               value="<%= produto != null ? produto.getPrecoVenda() : "" %>" 
               class="form-control">
    </div>

    <!-- Botão de envio -->
    <button type="submit" class="btn btn-primary">
        <%= produto != null ? "Alterar" : "Incluir" %>
    </button>

</form>

</body>
</html>
