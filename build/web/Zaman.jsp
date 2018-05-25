<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="style.css" rel="stylesheet" type="text/css"/>
        
    <title>JSP Page</title>
</head>
<body>
   
    
    <sql:setDataSource  var="aglama"
                        driver="com.mysql.jdbc.Driver"
                        url="jdbc:mysql://localhost/depotakipvt"
                        user="root"
                        password="199144"/>
    
    <%
        Date dt = new Date();
        SimpleDateFormat format = new SimpleDateFormat("dd:yyyy:mm * hh-mm-ss");
        format.format(dt);
    %>
    <c:set var="no1" value="5" />
    <c:set var="first" value="Dursun" />
    <c:set var="last" value="Kalbim" />
    <c:set var="dr" value="<%=dt%>" />
    
    <c:set var="no2" value="6" />
    <c:set var="first2" value="Musto" />
    <c:set var="last2" value="Deli" />
    
    
    <sql:transaction dataSource="${aglama}">
        <sql:update var="ekleme_1">
            INSERT INTO test(no,first,last,dob) VALUES (?,?,?,?);
            
            <sql:param value="${no1}" />
            <sql:param  value="${first}" />
            <sql:param value="${last}" />
            <sql:dateParam  type="DATE" value="${dr}" />
        </sql:update>
      
                  
            <sql:update var="ekleme_2">
                INSERT INTO test(no,first,last,dob) VALUES (?,?,?,?);
                
                <sql:param value="${no2}" />
                <sql:param value="${first2}" />
                <sql:param value="${last2}" />
                <sql:dateParam  type="DATE" value="${dr}" />
            </sql:update>
    </sql:transaction>
             
                   
                <sql:query dataSource="${aglama}" var="queryi">
                    SELECT * FROM test;
                </sql:query>
                    
                    <table>
                        <tr>
                            <c:forEach var="deme" items="${queryi.columnNames}">
                                <th><c:out  value="${deme}" /></th>
                            </c:forEach>
                        </tr>
                        
                        <c:forEach var="erken" items="${queryi.rows}">
                            <tr>
                                <td><c:out value="${erken.no}" /></td>
                                <td><c:out  value="${erken.first}"/></td>
                                <td><c:out  value="${erken.last}"/></td>
                                <td><c:out  value="${erken.dob}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
    
    
</body>
</html>
