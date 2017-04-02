<%-- 
    Document   : listarprodutos
    Created on : 17/10/2016, 09:52:21
    Author     : Alunos
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fatec Shop - Listagem de Produtos</title>
    </head>
    <body>
        <h1>Listagem de Produtos</h1>
        <%
          InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            String sql = "SELECT * FROM produtos ORDER BY descricao";
            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet res = comando.executeQuery();
            out.println("<table border=1>");
            out.println("<tr>"
                    +"<th>foto</th>"
                    + "<th>Id</th>"
                    + "<th>Descrição</th>"
                    + "<th>Preço</th>" 
                    + "<th>Estoque</th>"
                    + "</tr>");
            while(res.next()) {
                out.println("<tr>"
                    + "<td><img width=50 src=" + res.getInt("id") + ".gif></td>"
                    + "<td>" + res.getInt("id") + "</td>"    
                    + "<td>" + res.getString("descricao") + "</td>" 
                    + "<td>" + res.getString("preco") + "</td>" 
                    + "<td>" + res.getString("estoque") + "</td>"
                    + "</tr>");
                        }
        out.println("</table>");
        conexao.close();
        %>        
    </body>
</html>
