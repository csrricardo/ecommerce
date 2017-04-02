<%-- 
    Document   : incluir_produto
    Created on : 07/11/2016, 10:05:17
    Author     : Alunos
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fatec Shop  - Inclusão de Produto</title>
    </head>
    <body>
        <h1>Fatec Shop - Inclusão de Produto</h1>
        <%
            String descricao = request.getParameter("descricao");
            String preco = request.getParameter("preco");
            String estoque = request.getParameter("estoque");
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            String sql = "INSERT INTO produto "
                    + "(descricao, preco, estoque)"
                    + "VALUES (?, ?, ?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, descricao);
            comando.setDouble(2, Double.parseDouble(preco));
            comando.setInt(3, Integer.parseInt(estoque));
            int registrosIncluidos = comando.executeUpdate();
            if (registrosIncluidos > 0) {
                out.print("<h3>Produto incluido com sucessso</h3>");
            }else {
                out.print("<h3>FALHA NA INCLUSÃO</h3>");
            }        
        %>
        <a href="index.html">Voltar ao Inicio</a>
            
    </body>    
</html>
