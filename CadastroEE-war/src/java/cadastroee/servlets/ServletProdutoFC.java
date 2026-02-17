package cadastroee.servlets;

import cadastroee.ejb.ProdutoFacadeLocal;
import cadastroee.model.Produto;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ServletProdutoFC extends HttpServlet {

    @EJB
    private ProdutoFacadeLocal facade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String destino = "ProdutoLista.jsp";

        if (acao == null) {
            acao = "listar";
        }

        try {

            switch (acao) {

                case "listar":
                    request.setAttribute("lista", facade.findAll());
                    break;

                case "formIncluir":
                    destino = "ProdutoDados.jsp";
                    break;

                case "formAlterar":
                    destino = "ProdutoDados.jsp";
                    Integer idAlterar = Integer.parseInt(request.getParameter("id"));
                    request.setAttribute("produto", facade.find(idAlterar));
                    break;

                case "incluir":
                    Produto novo = new Produto();
                    novo.setNome(request.getParameter("nome"));
                    novo.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                    novo.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                    facade.create(novo);

                    request.setAttribute("lista", facade.findAll());
                    break;

                case "alterar":
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    Produto existente = facade.find(id);

                    existente.setNome(request.getParameter("nome"));
                    existente.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                    existente.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));

                    facade.edit(existente);
                    request.setAttribute("lista", facade.findAll());
                    break;

                case "excluir":
                    Integer idExcluir = Integer.parseInt(request.getParameter("id"));
                    Produto prodExcluir = facade.find(idExcluir);
                    facade.remove(prodExcluir);

                    request.setAttribute("lista", facade.findAll());
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
