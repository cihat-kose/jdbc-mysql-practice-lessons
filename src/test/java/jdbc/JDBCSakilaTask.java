package jdbc;

import org.testng.Assert;
import org.testng.annotations.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCSakilaTask extends JDBCParent {

    /**
         Task: Sakila Veritabanı ile JDBC Kullanımı

         1. Veritabanına Bağlanın
            Sakila veritabanına JDBC ile bağlantı kurunuz.

         2. Film Listesini Getirin ve Yazdırın
            "film" tablosundan tüm filmlerin listesini çekin ve konsola yazdırın.

         3. Yeni Bir Müşteri Ekleyin
            "customer" tablosuna yeni bir müşteri ekleyiniz.
            (İstediğiniz isim ve bilgileri kullanabilirsiniz.)

         4. Eklenen Müşteri Kaydını Sorgulayın ve Yazdırın
            Bir önceki adımda eklediğiniz müşteri bilgisini veritabanından sorgulayarak konsola yazdırınız.

         5. Bağlantıyı Kapatın
            İşlemler tamamlandıktan sonra veritabanı bağlantısını düzgün şekilde kapatınız.

         Notlar:
         - JDBC bağlantı ayarlarını kendi ortamınıza göre düzenleyin.
         - SQL sorguları ve Java kodu ile ilgili hata kontrollerini eklemeyi unutmayın.
     */

    @Test
    public void sakilaDatabaseFlowTest() {
        try {
            // SQL sorgusu oluşturma ve yürütme (Film Listesi)
            statement = connection.createStatement();

            // Film Listesi sorgusu ve yazdırma
            String filmSql = "SELECT film_id, title, release_year FROM film";
            try (ResultSet rs = statement.executeQuery(filmSql)) {
                System.out.println("\u001B[32m" + "Film Listesi:" + "\u001B[0m");
                while (rs.next()) {
                    int id = rs.getInt("film_id");
                    String title = rs.getString("title");
                    int releaseYear = rs.getInt("release_year");
                    System.out.println("Film ID: " + id + ", Başlık: " + title + ", Yayın Yılı: " + releaseYear);
                }
            }

            // create_date sütununa varsayılan bir değer atama
            String sqlAlterTable = "ALTER TABLE customer MODIFY COLUMN create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP";
            statement.executeUpdate(sqlAlterTable);

            // Yeni müşteri ekleme işlemi
            String firstName = "Mercan";
            String lastName = "Kaan";
            String email = "mercan@techno.com";
            int addressId = 44;
            int active = 1;

            String customerInsertSql = "INSERT INTO customer (store_id, first_name, last_name, email, address_id, active) " + "VALUES (1, '" + firstName + "', '" + lastName + "', '" + email + "', " + addressId + ", " + active + ")";
            statement.executeUpdate(customerInsertSql);
            System.out.println("\u001B[31m" + "\nYeni müşteri eklendi." + "\u001B[0m");

            // Yeni eklenen müşteriyi almak için SQL sorgusu oluşturma ve yürütme
            String newCustomerSql = "SELECT * FROM customer ORDER BY customer_id DESC LIMIT 1";
            String newFirstName = null;
            String newEmail = null;
            try (ResultSet newCustomerRs = statement.executeQuery(newCustomerSql)) {
                System.out.println("\u001B[33m" + "\nYeni Eklenen Müşteri Bilgisi:" + "\u001B[0m");
                if (newCustomerRs.next()) {
                    int id = newCustomerRs.getInt("customer_id");
                    newFirstName = newCustomerRs.getString("first_name");
                    String newLastName = newCustomerRs.getString("last_name");
                    newEmail = newCustomerRs.getString("email");
                    int newAddressId = newCustomerRs.getInt("address_id");
                    int newActive = newCustomerRs.getInt("active");
                    System.out.println("\nMüşteri ID: " + id + ", Ad: " + newFirstName + ", Soyad: " + newLastName + ", E-posta: " + newEmail + ", Adres ID: " + newAddressId + ", Aktif: " + newActive);
                }
            }
            Assert.assertEquals(newFirstName, firstName, "Eklenen müşteri adı doğru değil!");
            Assert.assertEquals(newEmail, email, "Eklenen müşteri emaili doğru değil!");

        } catch (SQLException se) {
            se.printStackTrace();
        }

        System.out.println("\u001B[32m" + "\nİşlem tamamlandı." + "\u001B[0m");
    }
}
