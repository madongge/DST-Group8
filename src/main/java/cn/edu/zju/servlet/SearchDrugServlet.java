package cn.edu.zju.servlet;

import cn.edu.zju.dbutils.DBUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/searchdrug")
public class SearchDrugServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name"); // 获取搜索框传来的name
        List<Object[]> results = new ArrayList<>();

        DBUtils.execSQL(connection -> {
            String sql = "SELECT d.id, d.name, dg.summary_markdown " +
                    "FROM drug d LEFT JOIN dosing_guideline dg ON d.id = dg.drug_id " +
                    "WHERE d.name LIKE ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, "%" + name + "%");
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Object[] row = new Object[3];
                        row[0] = rs.getString("id");
                        row[1] = rs.getString("name");
                        row[2] = rs.getString("summary_markdown");
                        results.add(row);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error executing SQL query", e);
            }
        });

        req.setAttribute("results", results);
        req.getRequestDispatcher("/views/searchdrug.jsp").forward(req, resp);
        System.out.println("Searching for drug name: " + name);
        System.out.println("Results: " + results.size());
    }
}