<%--
  Created by IntelliJ IDEA.
  User: hello
  Date: 2019-12-3
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <div class="sidebar-sticky">--%>
<%--        <ul class="nav flex-column">--%>
<%--            <li class="nav-item">--%>
<%--                <a class='nav-link ${param.active == "dashboard" ? "active" : ""}' href="<%=request.getContextPath()%>/">--%>
<%--                    <span data-feather="home"></span>--%>
<%--                    Dashboard <span class="sr-only">(current)</span>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </ul>--%>

<%--        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">--%>
<%--            <span>Precision Medicine Knowledge Base</span>--%>
<%--            <a class="d-flex align-items-center text-muted" href="#">--%>
<%--                <span data-feather="plus-circle"></span>--%>
<%--            </a>--%>
<%--        </h6>--%>
<%--        <ul class="nav flex-column mb-2">--%>
<%--            <li class="nav-item">--%>
<%--                <a class='nav-link ${param.active == "drugs" ? "active" : ""}' href="<%=request.getContextPath()%>/drugs">--%>
<%--                    <span data-feather="file-text"></span>--%>
<%--                    Drugs--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class='nav-link ${param.active == "drug_labels" ? "active" : ""}' href="<%=request.getContextPath()%>/drugLabels">--%>
<%--                    <span data-feather="file-text"></span>--%>
<%--                    Drug Labels--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class='nav-link ${param.active == "dosing_guideline" ? "active" : ""}' href="<%=request.getContextPath()%>/dosingGuideline">--%>
<%--                    <span data-feather="file-text"></span>--%>
<%--                    Dosing Guideline--%>
<%--                </a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Improved Medicine Matching System</a>
        <span class="badge badge-primary">Group8</span>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class='nav-link ${param.active == "dashboard" ? "active" : ""}' href="<%=request.getContextPath()%>/">
                        <span data-feather="home"></span>
                        Home <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class='nav-link ${param.active == "drugs" ? "active" : ""}' href="<%=request.getContextPath()%>/drugs">
                        <span data-feather="file-text"></span>
                        Drugs
                    </a>
                </li>
                <li class="nav-item">
                    <a class='nav-link ${param.active == "drug_labels" ? "active" : ""}' href="<%=request.getContextPath()%>/drugLabels">
                        <span data-feather="file-text"></span>
                        Drug Labels
                    </a>
                </li>
                <li class="nav-item">
                    <a class='nav-link ${param.active == "dosing_guideline" ? "active" : ""}' href="<%=request.getContextPath()%>/dosingGuideline">
                        <span data-feather="file-text"></span>
                        Dosing Guideline
                    </a>
                </li>
                <li class="nav-item">
                    <a class='nav-link ${param.active == "help" ? "active" : ""}' href="<%=request.getContextPath()%>/help">
                        <span data-feather="file-text"></span>
                        Help
                    </a>
                </li>


<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                        Dropdown--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <li><a class="dropdown-item" href="#">Action</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#">Another action</a></li>--%>
<%--                        <li><hr class="dropdown-divider"></li>--%>
<%--                        <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>



                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Drug ID</a>
                </li>

            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="text" id="searchInput" name="drugId" placeholder="Enter Drug ID...">
<%--                <button class="btn btn-outline-success" type="submit" value="Search" onclick="searchDrug()">Search</button>--%>
                <input class="btn btn-outline-success" type="button" value="Search" onclick="searchDrug()">
            </form>
<%--            <form id="searchForm">--%>
<%--                <label for="searchInput">Drug ID:</label>--%>
<%--                <input type="text" id="searchInput" name="drugId" placeholder="Enter Drug ID...">--%>
<%--                <input type="button" value="Search" onclick="searchDrug()">--%>
<%--            </form>--%>
<%--            <div id="result"></div>--%>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                function searchDrug() {
                    var drugId = $("#searchInput").val();
                    window.location.href = "drugSearch?id=" + drugId;

                    $.ajax({
                        url: 'drugSearch',
                        type: 'GET',
                        data: { id: drugId },
                        dataType: 'json',
                        success: function(data) {
                            let url = data.drugUrl || "#";
                            $("#result").html(`
                                    <h1>${data.name}</h1>
                                    <p>ID: ${data.id}</p>
                                    <p>Biomarker: ${data.biomarker ? 'Yes' : 'No'}</p>
                                    <p>URL: <a href="${url}">${url}</a></p>
                                `);
                        },

                    });
                }
            </script>
        </div>
    </div>
</nav>