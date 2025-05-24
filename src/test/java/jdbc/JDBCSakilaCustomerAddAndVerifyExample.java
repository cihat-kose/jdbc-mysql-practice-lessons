package jdbc;


import org.testng.Assert;
import org.testng.annotations.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCSakilaCustomerAddAndVerifyExample extends JDBCParent {
    /**
     * Sakila veritabanında JDBC ile:
     * 1) Yeni müşteri ekle
     * 2) En son eklenen 10 müşteriyi (customer_id'ye göre sıralı) ekrana yazdır
     * 3) Eklenen müşteriyi email ile bul ve assert ile doğrula
     */

    @Test
    public void addCustomerAndVerify(){
        String expectedFirstName= "Atilla";
        String expectedMail="atilla@demomail.com";
        String actualFirstName= null;
        String actualMail=null;

        // 1) Yeni müşteri ekle
        try {
        System.out.println("\n1) Yeni Müşteri Ekleniyor:");
        String soyad= "Erdem";
        int addressId=44;
        int aktif=1;

        String yeniMusteriSorgu="INSERT INTO customer (store_id, first_name, last_name, email, address_id, active) " +
                "VALUES (1, '" + expectedFirstName + "', '" + soyad + "', '" + expectedMail + "', " + addressId + ", " + aktif + ")";

            statement= connection.createStatement();
            statement.executeUpdate(yeniMusteriSorgu);
            System.out.println("Yeni müşteri eklendi: " + expectedFirstName + " " + soyad + " (" + expectedMail + ")");

            // 2) Son 10 müşteriyi yazdır
            System.out.println("\n2) En Son Eklenen 10 Müşteri:");
            String musteriListesiSorgusu="SELECT customer_id, first_name, last_name, email " + "FROM customer ORDER BY customer_id DESC LIMIT 10";

            try (ResultSet musteriRs = statement.executeQuery(musteriListesiSorgusu)) {
                while (musteriRs.next()) {
                    System.out.println("Müşteri ID: " + musteriRs.getInt("customer_id")
                            + ", Ad: " + musteriRs.getString("first_name")
                            + ", Soyad: " + musteriRs.getString("last_name")
                            + ", E-posta: " + musteriRs.getString("email"));
                }
            }

            // 3) Eklenen müşteriyi email ile bul ve doğrula
            System.out.println("\n3) Eklenen Müşteri Doğrulanıyor:");
            String musteriDogruSorgu = "SELECT first_name, email FROM customer WHERE email = '" + expectedMail + "'";

            try(ResultSet dogrulamaRs= statement.executeQuery(musteriDogruSorgu)){
                if(dogrulamaRs.next()){
                    actualFirstName =dogrulamaRs.getString("first_name");
                    actualMail = dogrulamaRs.getString("email");
                    System.out.println("Doğrulanan Müşteri - Ad: " + actualFirstName + ", E-posta: " + actualMail);
                }else{
                    System.out.println("Yeni müşteri bulunamadı!");
                }
            }

            Assert.assertEquals(actualFirstName,expectedFirstName, "Eklenen müşteri adı doğru değil!");
            Assert.assertEquals(actualMail,expectedMail, "Eklenen müşteri emaili doğru değil!");

            System.out.println("\n--- TÜM İŞLEMLER BAŞARIYLA TAMAMLANDI ---\n");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
