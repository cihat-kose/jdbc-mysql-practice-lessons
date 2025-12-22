package jdbc;

import org.testng.annotations.Test;

import java.sql.*;

public class JDBCPractices01 {

    @Test
    public void test1() throws SQLException {
        // Veritabanı bağlantısı için gerekli bilgiler tanımlanıyor
        String hostUrl = "jdbc:mysql://localhost:3306/sakila"; // Bağlantı adresi (URL)
        String username = "root"; // Kullanıcı adı
        String password = ".MySQL01,"; // Şifre (Herkes kendi şifresini girmeli)

        // 1) Bağlantı bilgileri girildi --> Bağlantı sağlandı.
        Connection connection = DriverManager.getConnection(hostUrl,username,password);

        // 2) Kullanılacak veritabanı seçildi
        // JDBC'de veritabanı seçimi, bağlantı URL'sinde (hostUrl) "/sakila" olarak belirtildiği için
        // ayrıca bir SQL komutu ile veritabanı seçmeye gerek yoktur. Bu nedenle ek bir işlem yapılmadı.
        // String hostUrl = "jdbc:mysql://localhost:3306/sakila";

        // 3) Sorgu ekranı açıldı (Statement oluşturuldu)
        Statement statement = connection.createStatement();

        // 4) Sorgu sorgu ekranına yazıldı ve çalıştırıldı
        ResultSet resultTable = statement.executeQuery("select * from actor");

        // 5) Sonuçlar aşağıda göründü
        resultTable.next(); // Bu aşamada ilk satıra geçildi

        String name = resultTable.getString("first_name"); // Aktörün adı alındı
        String lastName = resultTable.getString("last_name"); // Aktörün soyadı alındı
        System.out.println("name = " + name);
        System.out.println("lastName = " + lastName);

        resultTable.next(); // İkinci satıra geçildi

        name = resultTable.getString("first_name"); // Aktörün adı alındı
        lastName = resultTable.getString("last_name"); // Aktörün soyadı alındı
        System.out.println("name = " + name);
        System.out.println("lastName = " + lastName);

        connection.close(); // Bağlantı kapatıldı
    }
}
