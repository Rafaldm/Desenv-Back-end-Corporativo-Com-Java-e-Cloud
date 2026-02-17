# CadastroEE

Esse é um projeto de sistema cadastral Web feito em Java EE, com JSP, Servlets e EJBs.  
O objetivo é gerenciar produtos de uma loja, permitindo **listar, incluir, alterar e excluir produtos**.  

O design das páginas foi melhorado usando o **Bootstrap**, então tudo fica bonito e responsivo, funcionando bem em PC, tablet e celular.  

---

## Estrutura do projeto

- `CadastroEE-ejb/` → Contém a lógica de negócio e a persistência (JPA e EJB).  
- `CadastroEE-war/` → Contém a interface web (Servlets, JSPs e recursos estáticos).  
- `docs/` → PDFs e materiais da documentação do projeto.  
- `.gitignore` → Ignora arquivos desnecessários do NetBeans e builds.  

---

## Funcionalidades

- Listar produtos  
- Incluir novos produtos  
- Alterar produtos existentes  
- Excluir produtos  
- Interface amigável e responsiva com Bootstrap  

---

## Como rodar

1. Ter o **SQL Server** com o banco `loja` criado (use o script `loja.sql` se quiser).  
2. Abrir o projeto no **NetBeans**.  
3. Configurar a conexão com o SQL Server (`jdbc/loja`).  
4. Rodar o projeto usando o GlassFish.  
5. Acessar a aplicação pelo navegador:  
http://localhost:8080/CadastroEE-war/ServletProdutoFC?acao=listar


---

## Observações

- Todas as páginas usam Bootstrap, então não precisa se preocupar com CSS manual.  
- A comunicação entre Servlets e EJBs acontece com a anotação `@EJB`.  
- Qualquer pessoa pode baixar o projeto e rodar localmente, desde que configure o SQL Server.  
