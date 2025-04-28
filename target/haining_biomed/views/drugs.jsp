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
    <title>Drugs - Precision Medicine Matching System</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/static/jquery/jquery-3.4.1.js"></script>
    <script src="<%=request.getContextPath()%>/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Vis.js for network graph -->
    <script src="https://unpkg.com/vis-network/standalone/umd/vis-network.min.js"></script>
    <link href="<%=request.getContextPath()%>/static/css/app.css" rel="stylesheet">
    <style>
        .network-graph {
            width: 400px;
            height: 300px;
            border: 1px solid lightgray;
        }
        .no-genes {
            text-align: center;
            font-size: 16px;
            color: gray;
            line-height: 300px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">
        Precision Medicine Matching System
    </a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#">Sign out</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav.jsp">
            <jsp:param name="active" value="drugs"/>
        </jsp:include>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h2>Drugs</h2>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Drug Url</th>
                        <th>Biomarker</th>
                        <th>Network Graph</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${drugs}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td><a href="${item.drugUrl}" target="_blank">${item.drugUrl}</a></td>
                            <td>${item.biomarker}</td>
                            <td>
                                <div id="network-${item.id}" class="network-graph"></div>
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
