package cn.edu.zju.servlet;

import cn.edu.zju.bean.DosingGuideline;
import cn.edu.zju.dao.DosingGuidelineDao;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "DrugNetworkServlet", urlPatterns = "/drug-network")
public class DrugNetworkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DosingGuidelineDao dosingGuidelineDao = new DosingGuidelineDao();
        List<DosingGuideline> guidelineList = dosingGuidelineDao.findAll();

        // Map to hold the relationship between drug IDs and related genes
        Map<String, Set<String>> drugGeneMap = new HashMap<>();

        for (DosingGuideline guideline : guidelineList) {
            String drugId = guideline.getDrugId();
            String summary = guideline.getSummaryMarkdown();

            if (summary != null && !summary.isEmpty()) {
                Set<String> genes = extractGenes(summary);

                // If genes are found, add them to the map
                if (!genes.isEmpty()) {
                    if (!drugGeneMap.containsKey(drugId)) {
                        drugGeneMap.put(drugId, new HashSet<>());
                    }
                    drugGeneMap.get(drugId).addAll(genes);
                }
            }
        }

        // Handling drugs with no related genes
        for (String drugId : drugGeneMap.keySet()) {
            Set<String> genes = drugGeneMap.get(drugId);
            if (genes.isEmpty()) {
                genes.add("No related gene found");
            }
        }

        // Convert the map to JSON and send it as the response
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(new Gson().toJson(drugGeneMap));
    }

    // Method to extract genes based on a regular expression
    private Set<String> extractGenes(String summary) {
        Set<String> genes = new HashSet<>();
        // Regular expression to match gene-like sequences (uppercase letters and numbers)
        String regex = "\\b[A-Z0-9]{2,}\\b";

        java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
        java.util.regex.Matcher matcher = pattern.matcher(summary);

        // Find all matching gene names in the summary
        while (matcher.find()) {
            genes.add(matcher.group());
        }

        return genes;
    }
}
