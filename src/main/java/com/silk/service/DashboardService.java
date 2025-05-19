package com.silk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.silk.config.DbConfig;

public class DashboardService {

    public int getTotalOrders() {
        int count = 0;
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM takeaway")) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getCompletedOrders() {
        int count = 0;
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM takeaway WHERE status = 'Completed'")) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public double getTotalSales() {
        double total = 0;
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT ROUND(SUM(i.iceCream_Price * t.quantity), 2) AS total " +
                 "FROM takeaway t JOIN icecream i ON t.iceCream_id = i.iceCream_id " +
                 "WHERE t.status = 'Completed'")) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) total = rs.getDouble("total");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public String getMostPopularItem() {
        String name = "N/A";
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT i.iceCream_Name, SUM(t.quantity) AS totalQty " +
                 "FROM takeaway t JOIN icecream i ON t.iceCream_id = i.iceCream_id " +
                 "GROUP BY i.iceCream_Name ORDER BY totalQty DESC LIMIT 1")) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) name = rs.getString("iceCream_Name");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public int getTotalIceCreamFlavors() {
        int count = 0;
        try (Connection con = DbConfig.getDbConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM icecream WHERE iceCream_Availability = 'Available'")) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
