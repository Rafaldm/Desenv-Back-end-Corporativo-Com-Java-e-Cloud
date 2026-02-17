<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cadastroee.model.Produto"%>

<!DOCTYPE html>
<html>
<head>
    <title>Listagem de Produtos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-4">

<h2>Listagem de Produtos</h2>

<a href="ServletProdutoFC?acao=formIncluir" class="btn btn-primary m-2">Novo Produto</a>

<table class="table table-striped mt-3">
    <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço de Venda</th>
            <th>Opções</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Produto> lista = (List<Produto>) request.getAttribute("lista");
            if (lista != null && !lista.isEmpty()) {
                for (Produto p : lista) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNome() %></td>
            <td><%= p.getQuantidade() %></td>
            <td><%= p.getPrecoVenda() %></td>
            <td>
                <a href="ServletProdutoFC?acao=formAlterar&id=<%=p.getId()%>" class="btn btn-primary btn-sm me-1">Alterar</a>
                <a href="ServletProdutoFC?acao=excluir&id=<%=p.getId()%>" class="btn btn-danger btn-sm">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5" class="text-center">Nenhum produto cadastrado</td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

</body>
</html>
