<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: hello--%>
<%--  Date: 2019-12-3--%>
<%--  Time: 15:37--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page isELIgnored="false" %>--%>

<%--<!doctype html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="">--%>
<%--    <meta name="generator" content="">--%>
<%--    <title>Dashboard Template · Bootstrap</title>--%>

<%--    <!-- Bootstrap core CSS -->--%>
<%--    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">--%>
<%--    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>--%>
<%--    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<%--    <!-- Custom styles for this template -->--%>
<%--    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        .bd-placeholder-img {--%>
<%--            font-size: 1.125rem;--%>
<%--            text-anchor: middle;--%>
<%--            -webkit-user-select: none;--%>
<%--            -moz-user-select: none;--%>
<%--            -ms-user-select: none;--%>
<%--            user-select: none;--%>
<%--        }--%>

<%--        @media (min-width: 768px) {--%>
<%--            .bd-placeholder-img-lg {--%>
<%--                font-size: 3.5rem;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<jsp:include page="head.jsp" />&ndash;%&gt;--%>

<%--<div class="container-fluid">--%>
<%--    <div class="row">--%>
<%--        <jsp:include page="nav.jsp" >--%>
<%--            <jsp:param name="active" value="drugs" />--%>
<%--        </jsp:include>--%>

<%--        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">--%>
<%--            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">--%>
<%--                <h2>Drugs</h2>--%>
<%--            </div>--%>
<%--            <div class="table-responsive">--%>
<%--                <table class="table table-striped table-sm">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>#</th>--%>
<%--                        <th>Name</th>--%>
<%--                        <th>Drug Url</th>--%>
<%--                        <th>Biomarker</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach items="${drugs}" var="item">--%>
<%--                        <tr>--%>
<%--                            <td>${item.id}</td>--%>
<%--                            <td>${item.name}</td>--%>
<%--                            <td>${item.drugUrl}</td>--%>
<%--                            <td>${item.biomarker}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>

<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </main>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
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
    <meta name="generator" content="">
    <title>Dashboard Template · Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Custom styles for this template -->
    <script src="https://unpkg.com/vis-network/standalone/umd/vis-network.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
<%--<jsp:include page="head.jsp" />--%>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav.jsp">
            <jsp:param name="active" value="drugs" />
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Drugs</h2>
            </div>

            <!-- Search box begin -->
            <div class="row justify-content-center mb-3">
                <div class="col-md-8">
                    <form action="${pageContext.request.contextPath}/searchdrug" method="get" class="form-inline">
                        <input type="text" class="form-control mr-2 flex-grow-1" name="name" placeholder="Enter drug name" required>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>
            </div>
            <!-- Search box close -->

            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Drug URL</th>
                        <th>Biomarker</th>
                        <th>Network Graph</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${drugs}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td>${item.drugUrl}</td>
                            <td>${item.biomarker}</td>
                            <td>
                                <div id="network-${item.id}" class="network-graph"></div>
                            </td>
                        </tr>
                    </c:forEach>

                    <!-- After searching -->
                    <c:if test="${not empty results}">
                        <c:forEach items="${results}" var="result">
                            <tr>
                                <td>${result[0]}</td>
                                <td>${result[1]}</td>
                                <td colspan="2">${result[2]}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
<script>
    $(document).ready(function() {
        $.getJSON("<%=request.getContextPath()%>/drug-network", function(data) {
            <c:forEach items="${drugs}" var="item">
            (function() {
                var drugId = "${item.id}";
                var drugName = "${item.name}";
                var container = document.getElementById("network-" + drugId);
                if (!container) return;

                var nodes = new vis.DataSet([
                    { id: drugId, label: drugName, shape: "box" }
                ]);
                var edges = [];

                var genes = data[drugId];
                if (genes && genes.length > 0) {
                    genes.forEach(function(gene) {
                        nodes.add({
                            id: drugId + "-" + gene,
                            label: gene,
                            shape: "ellipse",
                            color: "lightblue",
                            font: { color: 'blue', size: 14, underline: true }
                        });
                        edges.push({ from: drugId, to: drugId + "-" + gene });
                    });

                    var network = new vis.Network(container, {
                        nodes: nodes,
                        edges: edges
                    }, {
                        interaction: { hover: true },
                        physics: { stabilization: true }
                    });

                    // 绑定点击事件，实现跳转
                    network.on("click", function(params) {
                        if (params.nodes.length > 0) {
                            var nodeId = params.nodes[0];
                            if (nodeId.startsWith(drugId + "-")) {
                                var geneName = nodeId.substring((drugId + "-").length);
                                var geneLink = "https://www.genecards.org/cgi-bin/carddisp.pl?gene=" + geneName + "&keywords=" + geneName;
                                window.open(geneLink, "_blank"); // 在新标签页打开
                            }
                        }
                    });

                } else {
                    container.innerHTML = '<div class="no-genes">No related gene found</div>';
                }
            })();
            </c:forEach>
        });
    });
</script>
</body>
</html>