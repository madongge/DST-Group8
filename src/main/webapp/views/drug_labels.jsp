<%--
  Created by IntelliJ IDEA.
  User: hello
  Date: 2019-12-3
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dashboard Template · Bootstrap</title>

    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/app.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Precision Medicine Matching System</a>
</nav>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav.jsp">
            <jsp:param name="active" value="drug_labels" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Drug Labels</h2>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Source</th>
                        <th>Dosing Information</th>
                        <th>Summary Markdown</th>
                        <th>Gene Links</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${drugLabels}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.source}</td>
                            <td>${item.dosingInformation}</td>
                            <td>${item.summaryMarkdown.html}</td>
                            <td>
                                <c:forEach items="${item.relatedGenes}" var="gene">
                                    <a href="javascript:void(0);" onclick="fetchGeneInfo('${item.id}', '${gene.id}')">
                                            ${gene.symbol}
                                    </a><br/>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<script>
    function fetchGeneInfo(labelId, geneId) {
        fetch('<%=request.getContextPath()%>/drugLabels?labelId=' + labelId + '&geneId=' + geneId)
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert("mistaken information: " + data.error);
                } else {
                    alert(
                        "Gene Info:\n" +
                        "Name: " + (data.name || "N/A") + "\n" +
                        "Symbol: " + (data.symbol || "N/A") + "\n"
                    );
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('please try later');
            });
    }
</script>

</body>
</html>