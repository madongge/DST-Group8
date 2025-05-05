package cn.edu.zju.servlet;


import cn.edu.zju.bean.Drug;
import cn.edu.zju.bean.DrugLabel;
import cn.edu.zju.dao.DrugDao;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/drugSearch")
public class DrugSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String drugId = request.getParameter("id");
        if (drugId == null || drugId.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Drug ID cannot be empty");
            return;
        }

        DrugDao drugDao = new DrugDao();
        Drug drug = drugDao.findById(drugId);

        if (drug != null) {
            request.setAttribute("drug", drug);
            System.out.println("Drug ID: " + drugId);
            System.out.println("Returned JSON: " + new Gson().toJson(drug));
            request.getRequestDispatcher("/views/drug_detail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Drug not found");
        }
    }
}