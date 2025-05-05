package cn.edu.zju.dao;

import cn.edu.zju.bean.Drug;
import cn.edu.zju.dbutils.DBUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DrugDao extends BaseDao {

    private static final Logger log = LoggerFactory.getLogger(DrugDao.class);

    public boolean existsById(String id) {
        return super.existsById(id, "drug");
    }

    public void saveDrug(Drug drug) {
        DBUtils.execSQL(connection -> {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("insert into drug (id, name, obj_cls, biomarker, drug_url) values    (?,?,?,?,?)");
                preparedStatement.setString(1, drug.getId());
                preparedStatement.setString(2, drug.getName());
                preparedStatement.setString(3, drug.getObjCls());
                preparedStatement.setBoolean(4, drug.isBiomarker());
                preparedStatement.setString(5, drug.getDrugUrl());
                preparedStatement.execute();
            } catch (SQLException e) {
                log.info("", e);
            }
        });

    }

    public List<Drug> findAll() {
        List<Drug> drugs = new ArrayList<>();
        DBUtils.execSQL(connection -> {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select id,name,obj_cls,drug_url,biomarker from drug");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String id = resultSet.getString("id");
                    String name = resultSet.getString("name");
                    String objCls = resultSet.getString("obj_cls");
                    String drugUrl = resultSet.getString("drug_url");
                    boolean biomarker = resultSet.getBoolean("biomarker");
                    Drug drug = new Drug(id, name, biomarker, drugUrl, objCls);
                    drugs.add(drug);
                }
            } catch (SQLException e) {
                log.info("", e);
            }
        });
        return drugs;
    }

    public Drug findById(String drugId) {
        Drug[] foundDrug = new Drug[1];
        DBUtils.execSQL(connection -> {
            try (PreparedStatement ps = connection.prepareStatement(
                    "SELECT id, name, obj_cls, drug_url, biomarker FROM drug WHERE id = ?")) {

                ps.setString(1, drugId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    foundDrug[0] = new Drug(
                            rs.getString("id"),
                            rs.getString("name"),
                            rs.getBoolean("biomarker"),
                            rs.getString("drug_url"),
                            rs.getString("obj_cls")
                    );
                }


            } catch (SQLException e) {
                log.error("Query failed for drugId: {}", drugId, e);
            }
        });
        return foundDrug[0];
    }

}