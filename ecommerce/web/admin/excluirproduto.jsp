<%-- 
    Document   : excluirproduto
    Created on : 16/11/2016, 09:59:10
    Author     : Alunos
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fatec Shop - Exclusão de Produto</title>
    </head>
    <body>
        <h1>Fatec Shop - Exclusão de Produto</h1>
        <%
            String codigo = request.getParameter("codigo");
            
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            String sql  = "DELETE FROM produto WHERE codigo = ?";
            
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, Integer.parseInt(codigo));
            
            if (comando.executeUpdate()> 0){
            
            out.print("<h3>Produto excluido com sucesso</h3>");
        } else {
            out.print("<h3>FALHA NA EXCLUSÃO</h3>");
            } 
        
        %>
        <a href="index.html">Voltar</a>
    </body>
</html>
