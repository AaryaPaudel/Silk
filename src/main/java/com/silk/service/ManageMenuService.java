package com.silk.service;

import com.silk.model.IceCreamModel;
import com.silk.config.DbConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageMenuService {

    public List<IceCreamModel> getAllIceCreams() {
        List<IceCreamModel> iceCreamList = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM IceCream");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                IceCreamModel iceCream = new IceCreamModel(
                        rs.getInt("icecream_Id"),
                        rs.getString("iceCream_Name"),
                        rs.getFloat("iceCream_Price"),
                        rs.getString("iceCream_Type"),
                        rs.getString("iceCream_Desc"),
                        rs.getString("iceCream_Availability")
                );
                iceCreamList.add(iceCream);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return iceCreamList;
    }
}
