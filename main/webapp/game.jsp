<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page import="game.GameBean.GameState" %>
<%@page import="game.Cell" %>
<%@page import="game.Line" %>

<jsp:useBean id="gameBean" scope="session" class="game.GameBean" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cuatro en Raya</title>
</head>
<body>
    <h1>Cuatro en Raya</h1>
    <table border="5">
        <c:forEach var="line" items="${gameBean.gridLines}">
        <tr>
            <c:forEach var="cell" items="${gameBean.getGridStatus(line)}">
            <td>
                <c:choose>
                    <c:when test="${cell.state == 'X'}">
                        <img src="img/state_x.png" alt="X"/>
                    </c:when>
                    <c:when test="${cell.state == 'O'}">
                        <img src="img/state_o.png" alt="O"/>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${winner == null}">
                        </c:if>
                            <a href="gameServlet?Line=${cell.line}&Col=${cell.col}">
                        		
                            		<img src="img/state_null.png" alt="null"/>
                            </a>
                        		<c:if test="${winner == null}">
                            
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </td>    
            </c:forEach>
        </tr>
        </c:forEach>
    </table>
    <c:if test="${winner != null}">
        <h2>${winner} ¡Ha ganado!</h2>
        <form action="index.jsp" method="post">
            <input type="submit" name="Replay" value="Jugar de nuevo"><br/>
        </form>
    </c:if>
</body>
</html>


