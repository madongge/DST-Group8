package cn.edu.zju.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet(name = "DrugLabelServlet", urlPatterns = "/drugLabels")
public class DrugLabelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String labelId = request.getParameter("labelId");
        String geneId = request.getParameter("geneId");
        Gson gson = new Gson();

        if (labelId != null && geneId != null && !labelId.isEmpty() && !geneId.isEmpty()) {
            String apiUrl = "https://api.pharmgkb.org/v1/data/label/" + labelId;
            try {
                HttpURLConnection conn = (HttpURLConnection) new URL(apiUrl).openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Accept", "application/json");

                if (conn.getResponseCode() != 200) {
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write("{\"error\": \"PharmGKB接口访问失败\"}");
                    return;
                }

                InputStreamReader reader = new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8);
                Map<String, Object> labelInfo = gson.fromJson(reader, Map.class);
                reader.close();
                conn.disconnect();

                if (labelInfo == null || !labelInfo.containsKey("data")) {
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write("{\"error\": \"Label返回数据缺少data字段\"}");
                    return;
                }

                Map<String, Object> dataMap = (Map<String, Object>) labelInfo.get("data");

                if (dataMap == null || !dataMap.containsKey("relatedGenes")) {
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write("{\"error\": \"Label数据中没有relatedGenes\"}");
                    return;
                }

                List<Map> relatedGenes = (List<Map>) dataMap.get("relatedGenes");

                Map<String, Object> targetGene = null;
                for (Map gene : relatedGenes) {
                    if (geneId.equals(gene.get("id"))) {
                        targetGene = gene;
                        break;
                    }
                }

                if (targetGene == null) {
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write("{\"error\": \"找不到对应Gene\"}");
                    return;
                }

                Map<String, Object> result = Map.of(
                        "name", targetGene.getOrDefault("name", ""),
                        "symbol", targetGene.getOrDefault("symbol", "")
                );

                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write(gson.toJson(result));
                return;

            } catch (Exception e) {
                e.printStackTrace();
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write("{\"error\": \"服务器异常\"}");
                return;
            }
        }

        // 正常加载drugLabels页面（从resources里面读）
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("drugLabels.data");
        if (inputStream == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "drugLabels.data not found");
            return;
        }

        List<String> drugLabelsContent = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))
                .lines()
                .collect(Collectors.toList());

        List<Map> drugLabels = drugLabelsContent.stream()
                .map(x -> gson.fromJson(x, Map.class))
                .collect(Collectors.toList());

        request.setAttribute("drugLabels", drugLabels);
        request.getRequestDispatcher("/views/drug_labels.jsp").forward(request, response);
    }
}