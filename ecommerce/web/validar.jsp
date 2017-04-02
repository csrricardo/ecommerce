<%-- 
    Document   : validar
    Created on : 31/10/2016, 08:13:14
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
        <title>Fatec Shop</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            
            String sql = "SELECT * FROM clientes WHERE email = ? AND senha = ?";
            
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, email);
            comando.setString(2, senha);                             
            
            ResultSet resultado = comando.executeQuery();
            if (resultado.next()){
            
                String nomeDoUsuario = resultado.getString("nome");
                session.setAttribute("usuario", nomeDoUsuario);
                out.print("<h3>BEM VINDO(a) DE VOLTA, " + nomeDoUsuario + "!</h3>");
                
                out.print("<h2>Produtos Disponivel</h2>");                
                
            sql = "SELECT * FROM produtos ORDER BY descricao";
            comando = conexao.prepareStatement(sql);
            ResultSet res = comando.executeQuery();
            out.println("<table border=1>");
            out.println("<tr>"
                    +"<th>Foto</th>"                   
                    + "<th>Descrição</th>"
                    + "<th>Preço</th>" 
                    + "<th>Estoque</th>"
                    + "<th></th>"
                    + "</tr>");
            while(res.next()) {
                out.println("<tr>"
                    + "<td><img width=50 src=" + res.getInt("id") + ".gif></td>"                       
                    + "<td>" + res.getString("descricao") + "</td>" 
                    + "<td>" + res.getString("preco") + "</td>" 
                    + "<td>" + res.getString("estoque") + "</td>"
                        +"<td><a href=comprar.jsp>Comprar</a></td>" 
                    + "</tr>");
                        }
        out.println("</table>");
                %>
                <a href="index.html">
                    <h2>Voltar ao Login.</h2> 
                    <a>
                <%
            }else {             
            %>                
             <div style="color: red; font-size: x-large">
                     Email não cadastrado ou senha invalida.
                             </div>
                             <br>
                             <a href="index.html">
                                     Clique aqui para tentar novamente.
                               </a>
             <%
            }
            conexao.close();
            %>
        
    </body>
</html>
